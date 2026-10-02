terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_kms_key" "cloudguard" {
  description             = "CloudGuard S3 security logs encryption key"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Project     = "CloudGuard"
    Environment = "security-demo"
  }
}

resource "aws_s3_bucket" "cloudguard_security_logs" {
  tags = {
    Project     = "CloudGuard"
    Environment = "security-demo"
  }
}

resource "aws_s3_bucket_public_access_block" "cloudguard_security_logs" {
  bucket = aws_s3_bucket.cloudguard_security_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "cloudguard_security_logs" {
  bucket = aws_s3_bucket.cloudguard_security_logs.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "cloudguard_security_logs" {
  bucket = aws_s3_bucket.cloudguard_security_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudguard_security_logs" {
  bucket = aws_s3_bucket.cloudguard_security_logs.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.cloudguard.arn
      sse_algorithm     = "aws:kms"
    }

    bucket_key_enabled = true
  }
}