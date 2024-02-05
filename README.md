# p81 Project Repository

## Overview

This repository hosts the infrastructure and application code for the p81 project, with a focus on AWS CloudFront and S3 services. The project leverages Terraform for Infrastructure as Code (IaC), wrapped with Terragrunt, and employs GitHub Actions for the CI/CD pipelines.

## Structure

- `.github/workflows/main.yml` - Defines the GitHub Actions workflow for deploying infrastructure and executing application scripts.
- `python/data_processing.py` - Contains a Python script for data processing tasks, such as downloading, filtering products, uploading to S3, and printing their content.
- `terraform/` - Includes Terraform modules and configurations specific to different environments.
  - `environments/dev/` - Houses Terragrunt configurations for the development (`dev`) environment.
  - `modules/` - Contains reusable Terraform modules for CloudFront (`cloudfront`) and S3 (`s3`).

## Usage

To deploy the infrastructure:
1. Configure your environment variables in `terraform/.env`.
2. Execute Terragrunt commands within `terraform/environments/dev/` to initialize and apply the configurations.

The GitHub Actions workflow will automatically deploy commits pushed to the `main` branch.

## Notes

- Terraform state management is performed using an S3 bucket via Terragrunt.
- Ensure that AWS credentials are correctly configured as GitHub Actions secrets to enable both Terraform and Python code to interact with your AWS account.

## Future Improvements

- Implement a script to gracefully destroy the environment, utilizing the AWS CLI to empty the S3 buckets. Terragrunt will manage the resource teardown, while bucket names will be dynamically generated per environment to allow deletion with the cli.
