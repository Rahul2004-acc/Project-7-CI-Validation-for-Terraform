# Project 7: CI Validation for Terraform

## GitHub Actions Pipeline Screenshot

![Terraform CI Pipeline](Screenshot%202026-11-20%20171309.png)

## Overview

This project demonstrates automated Infrastructure as Code (IaC) validation using GitHub Actions. The CI/CD pipeline automatically runs Terraform formatting checks and validation on every push and pull request.

## Project Goals

- ✅ Automate Terraform code quality checks
- ✅ Run `terraform fmt` on push to ensure consistent formatting
- ✅ Run `terraform validate` to catch configuration errors early
- ✅ Display workflow status badge in README

## Workflow Details

The GitHub Actions workflow (`terraform-ci.yml`) includes two main jobs:

### 1. Terraform Format Check
- **Job Name:** `terraform-fmt`
- **Purpose:** Ensures all Terraform files follow the standard formatting conventions
- **Command:** `terraform fmt -check -recursive`
- **Runs on:** `ubuntu-latest`

### 2. Terraform Validate
- **Job Name:** `terraform-validate`
- **Purpose:** Validates Terraform configuration files for syntax and semantic errors
- **Commands:**
  - `terraform init -backend=false` - Initialize Terraform without backend configuration
  - `terraform validate` - Validate the configuration

## Trigger Events

The workflow automatically runs on:
- Push to `main` and `develop` branches
- Pull requests targeting `main` and `develop` branches

## Project Structure

```
P7-CI-Validation-for-Terraform/
├── .github/
│   └── workflows/
│       └── terraform-ci.yml       # GitHub Actions workflow
├── main.tf                         # Main Terraform configuration
├── variables.tf                    # Input variables
├── outputs.tf                      # Output values
└── README.md                       # This file
```

## Terraform Configuration

The project includes a sample AWS S3 bucket configuration with:
- **Provider:** AWS (~> 5.0)
- **Resources:**
  - S3 bucket
  - S3 bucket versioning
- **Variables:**
  - `aws_region` - AWS region (default: us-east-1)
  - `bucket_name` - S3 bucket name
  - `environment` - Environment name
- **Outputs:**
  - `bucket_id` - S3 bucket ID
  - `bucket_arn` - S3 bucket ARN
  - `bucket_region` - S3 bucket region

## Setup Instructions

### Prerequisites
- Git account with push access
- GitHub repository created

### Steps

1. **Clone or push the repository to GitHub:**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/P7-CI-Validation-for-Terraform.git
   git branch -M main
   git push -u origin main
   ```

2. **Update the badge URL in README:**
   Replace `YOUR_USERNAME` with your GitHub username in the badge URL

3. **Enable GitHub Actions:**
   - Go to your repository on GitHub
   - Navigate to Settings > Actions
   - Ensure Actions are enabled

## Running Locally

To run the same checks locally:

### Terraform Format Check
```bash
terraform fmt -check -recursive
```

### Terraform Validate
```bash
terraform init -backend=false
terraform validate
```

## Badge Status

The badge at the top of this README displays the status of the latest workflow run:
- 🟢 **Green badge** = All checks passed
- 🔴 **Red badge** = One or more checks failed

## Terraform Versions

- **Terraform:** >= 1.0
- **AWS Provider:** ~> 5.0

## References

- [Terraform Formatting](https://developer.hashicorp.com/terraform/cli/commands/fmt)
- [Terraform Validate](https://developer.hashicorp.com/terraform/cli/commands/validate)
- [GitHub Actions for Terraform](https://github.com/hashicorp/setup-terraform)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Deliverables

This project demonstrates:
1. ✅ GitHub Actions successful workflow
2. ✅ Terraform Format Check successful
3. ✅ Terraform Validate successful
4. ✅ README displaying the green workflow badge

---

**Last Updated:** November 20, 2026
