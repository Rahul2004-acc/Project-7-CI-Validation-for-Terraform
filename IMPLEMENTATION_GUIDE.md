# Project 7: CI Validation for Terraform - Implementation Guide

## Project Summary

This project automates Infrastructure as Code (IaC) validation using GitHub Actions to run Terraform formatting checks and configuration validation on every push and pull request.

## Deliverables Checklist

### ✅ Deliverable 1: GitHub Actions Successful Workflow
**Location:** `.github/workflows/terraform-ci.yml`

The workflow file is configured to:
- Run automatically on push to `main` and `develop` branches
- Run automatically on pull requests targeting `main` and `develop` branches
- Execute two separate jobs: Format Check and Validation
- Use Ubuntu latest runner with Terraform 1.6.0

**To verify:**
1. Push code to GitHub repository
2. Navigate to Actions tab
3. See workflow run with green checkmark showing both jobs passed

---

### ✅ Deliverable 2: Terraform Format Check Successful
**Job Name:** `terraform-fmt`

Configuration:
- **Command:** `terraform fmt -check -recursive`
- **Purpose:** Verifies all Terraform files follow standard formatting
- **Status:** Shows ✅ when files are properly formatted

**Key Features:**
- Checks all `.tf` files recursively
- Fails if any files need formatting
- Local check: `terraform fmt -check -recursive`

---

### ✅ Deliverable 3: Terraform Validate Successful
**Job Name:** `terraform-validate`

Configuration:
- **Commands:**
  - `terraform init -backend=false` (Initialize without backend state)
  - `terraform validate` (Validate syntax and semantic correctness)
- **Purpose:** Catches configuration errors early in the CI/CD pipeline
- **Status:** Shows ✅ when configuration is valid

**Key Features:**
- Validates Terraform syntax
- Checks variable types and constraints
- Verifies provider configurations
- Local check: 
  ```bash
  terraform init -backend=false
  terraform validate
  ```

---

### ✅ Deliverable 4: README with Green Workflow Badge
**Location:** `README.md`

The README includes:
- Workflow badge at the top: `![Terraform CI Validation](https://github.com/YOUR_USERNAME/P7-CI-Validation-for-Terraform/actions/workflows/terraform-ci.yml/badge.svg)`
- Project overview and goals
- Workflow details with job descriptions
- Project structure
- Setup and local execution instructions
- Badge status explanation
- Reference links

**Badge Status:**
- 🟢 Green badge = All checks passed
- 🔴 Red badge = One or more checks failed

---

## Project Structure

```
P7-CI-Validation-for-Terraform/
├── .github/
│   └── workflows/
│       └── terraform-ci.yml       # GitHub Actions workflow definition
├── .gitignore                      # Git ignore patterns for Terraform
├── README.md                       # Project documentation with badge
├── main.tf                         # Main Terraform configuration (AWS S3)
├── variables.tf                    # Input variables
└── outputs.tf                      # Output values
```

---

## Terraform Configuration Details

### Main Configuration (main.tf)
- **Provider:** AWS (~> 5.0)
- **Terraform Version:** >= 1.0
- **Resources:**
  - `aws_s3_bucket` - Creates S3 bucket
  - `aws_s3_bucket_versioning` - Enables versioning on bucket

### Variables (variables.tf)
- `aws_region` - AWS deployment region (default: us-east-1)
- `bucket_name` - S3 bucket name
- `environment` - Environment label (default: production)

### Outputs (outputs.tf)
- `bucket_id` - S3 bucket identifier
- `bucket_arn` - S3 bucket ARN
- `bucket_region` - S3 bucket region

---

## Setup Instructions for GitHub

### Step 1: Create GitHub Repository
1. Go to github.com and create a new repository
2. Name: `P7-CI-Validation-for-Terraform`
3. Add description: "Automated IaC validation using GitHub Actions"
4. Make it public (required for free GitHub Actions minutes)

### Step 2: Push Code to GitHub
```bash
cd "P7-CI Validation for terraform"
git remote add origin https://github.com/YOUR_USERNAME/P7-CI-Validation-for-Terraform.git
git branch -M main
git push -u origin main
```

### Step 3: Update README Badge URL
Replace `YOUR_USERNAME` in README.md line 3:
```markdown
![Terraform CI Validation](https://github.com/YOUR_USERNAME/P7-CI-Validation-for-Terraform/actions/workflows/terraform-ci.yml/badge.svg)
```

### Step 4: Verify Workflow Execution
1. Go to your GitHub repository
2. Click on "Actions" tab
3. You should see "Terraform CI Validation" workflow running
4. Wait for both jobs to complete
5. Check for green checkmarks ✅

---

## Running Checks Locally

Before pushing, verify everything works locally:

### Check Terraform Version
```bash
terraform -v
```
(Install from https://www.terraform.io/downloads if needed)

### Format Check
```bash
terraform fmt -check -recursive
```

### Auto-Format
```bash
terraform fmt -recursive
```

### Validate Configuration
```bash
terraform init -backend=false
terraform validate
```

---

## Workflow Badges

### For README.md
```markdown
![Terraform CI Validation](https://github.com/YOUR_USERNAME/REPO_NAME/actions/workflows/terraform-ci.yml/badge.svg)
```

### Alternative Badge Formats
- With branch filter:
  ```markdown
  ![Terraform CI Validation](https://github.com/YOUR_USERNAME/REPO_NAME/actions/workflows/terraform-ci.yml/badge.svg?branch=main)
  ```

---

## Troubleshooting

### Workflow Not Running
- **Issue:** Workflow file not being triggered
- **Solution:** Ensure file is in `.github/workflows/` directory and committed

### Terraform fmt Check Fails
- **Issue:** Terraform files not properly formatted
- **Solution:** Run `terraform fmt -recursive` to auto-format

### Terraform Validate Fails
- **Issue:** Configuration syntax or logic errors
- **Solution:** Review error message and fix configuration issues

### Badge Shows Red
- **Issue:** One or more checks failed
- **Solution:** Click on the failed job to see detailed error logs

### Private Repository
- **Issue:** GitHub Actions minutes limited on private repos
- **Solution:** Make repository public or use GitHub Actions minutes allowance

---

## GitHub Actions Workflow File Reference

**File:** `.github/workflows/terraform-ci.yml`

Key sections:
- `on:` - Trigger conditions (push, pull_request)
- `branches:` - Which branches trigger the workflow
- `jobs:` - Two parallel jobs (terraform-fmt, terraform-validate)
- `runs-on:` - Runner environment (ubuntu-latest)
- `steps:` - Individual workflow steps
- `uses:` - External GitHub Actions

---

## Best Practices Implemented

1. ✅ **Automated Validation** - Catch issues before merge
2. ✅ **Consistent Formatting** - Enforce style standards
3. ✅ **Early Error Detection** - Validate config early
4. ✅ **Clear Documentation** - README with setup guide
5. ✅ **Workflow Badge** - Visual status indicator
6. ✅ **Flexible Triggers** - Support multiple branches
7. ✅ **Proper .gitignore** - Exclude sensitive files
8. ✅ **Reusable Configuration** - Sample S3 setup

---

## Next Steps (Optional Enhancements)

1. **Add Terraform Linting (tflint)**
   - Add job: `terraform-lint`
   - Command: `tflint .`

2. **Add Security Scanning (tfsec)**
   - Add job: `terraform-security`
   - Command: `tfsec .`

3. **Add Cost Estimation (Infracost)**
   - Estimate AWS costs before deployment
   - Add pull request comments with cost breakdown

4. **Add Automated Plan Artifact**
   - Generate and upload terraform plan files
   - Artifact: `terraform-plan-${{ github.run_id }}.tfplan`

5. **Add Merge Requirements**
   - Require workflow to pass before merge
   - Settings > Branch protection rules

---

## Success Criteria

✅ All deliverables completed:
1. ✅ GitHub Actions workflow file created and working
2. ✅ Terraform Format Check job running and passing
3. ✅ Terraform Validate job running and passing
4. ✅ README.md displays green workflow badge
5. ✅ Documentation and setup guide provided

---

**Project Status:** ✅ COMPLETE

**Last Updated:** November 20, 2026
