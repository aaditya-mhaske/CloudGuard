\# 🛡️ CloudGuard — DevSecOps \& Cloud Security Pipeline



CloudGuard is a hands-on DevSecOps project that integrates security throughout the software development lifecycle.



The project combines application testing, secret detection, dependency security, SAST, container vulnerability scanning, Infrastructure-as-Code security, Kubernetes hardening, SBOM generation, Docker hardening, and GitHub Actions automation.



\---



\## 🎯 Project Objective



The goal of CloudGuard is to demonstrate how security can be integrated directly into the development and CI/CD lifecycle rather than being performed only after deployment.



The pipeline automatically checks:



\- Application tests

\- Secrets

\- Python dependencies

\- Source code

\- Docker images

\- Dockerfile configuration

\- Kubernetes manifests

\- Terraform configuration

\- Software supply chain / SBOM



\---



\## 🏗️ Architecture



```text

&#x20;                        Developer

&#x20;                            │

&#x20;                            ▼

&#x20;                         Git Push

&#x20;                            │

&#x20;                            ▼

&#x20;                   ┌─────────────────┐

&#x20;                   │     GitHub      │

&#x20;                   └────────┬────────┘

&#x20;                            │

&#x20;                            ▼

&#x20;                   ┌─────────────────┐

&#x20;                   │ GitHub Actions  │

&#x20;                   └────────┬────────┘

&#x20;                            │

&#x20;       ┌────────────────────┼────────────────────┐

&#x20;       │                    │                    │

&#x20;       ▼                    ▼                    ▼

&#x20;    Pytest              Gitleaks            pip-audit

&#x20; Application Test     Secret Detection    Dependency Scan

&#x20;       │                    │                    │

&#x20;       └────────────────────┼────────────────────┘

&#x20;                            │

&#x20;                            ▼

&#x20;                        CodeQL

&#x20;                          SAST

&#x20;                            │

&#x20;                            ▼

&#x20;                      Docker Build

&#x20;                            │

&#x20;                            ▼

&#x20;                   Trivy Container Scan

&#x20;                            │

&#x20;                            ▼

&#x20;                      Trivy IaC Scan

&#x20;                            │

&#x20;                   ┌────────┼────────┐

&#x20;                   │        │        │

&#x20;                   ▼        ▼        ▼

&#x20;               Dockerfile  K8s   Terraform

&#x20;                            │

&#x20;                            ▼

&#x20;                       SBOM Generation

&#x20;                            │

&#x20;                            ▼

&#x20;                    Hardened Artifacts

