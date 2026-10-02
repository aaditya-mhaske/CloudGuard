# CloudGuard Security Architecture

CloudGuard is a hands-on DevSecOps and Cloud Security project.

## Security Controls

### Application Security
- Pytest automated testing
- CodeQL SAST
- Gitleaks secret detection
- pip-audit dependency vulnerability scanning

### Container Security
- Docker image hardening
- Non-root container execution
- Minimal Python slim base image
- OS package upgrades
- Docker HEALTHCHECK
- Trivy vulnerability scanning

### Infrastructure Security
- Terraform IaC security scanning
- Kubernetes manifest security scanning
- Kubernetes non-root security context
- Capability dropping
- Seccomp RuntimeDefault
- Read-only container filesystem
- Resource limits
- Service-account token disabled

### Software Supply Chain
- Container SBOM generation
- GitHub Actions security gates
- Automated scanning on pushes and pull requests

## Security Pipeline

Developer
    |
    v
GitHub
    |
    +--> Pytest
    |
    +--> Gitleaks
    |
    +--> pip-audit
    |
    +--> CodeQL SAST
    |
    +--> Docker Build
    |
    +--> Trivy Container Scan
    |
    +--> Trivy IaC Scan
    |
    +--> SBOM Generation
    |
    v
Hardened Deployment Artifacts

## Vulnerability Remediation

Baseline Docker image:
- HIGH: 51
- CRITICAL: 0

After package remediation:
- HIGH: 44
- CRITICAL: 0

Seven HIGH findings with available fixed versions were remediated through OS package upgrades.

The remaining findings are not automatically treated as exploitable; their status and available remediation must be evaluated individually.

## Principle

Security checks are integrated into the development lifecycle rather than performed only after deployment.
