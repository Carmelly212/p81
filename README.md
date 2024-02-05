# p81 Project Repository

## Overview

This repository contains the infrastructure and application code for the p81 project, focusing on AWS CloudFront and S3 services. It uses Terraform for infrastructure as code (IaC) wrapped with Terragrunt and GitHub Actions for CI/CD pipelines.

## Structure

- `.github/workflows/main.yml`: Defines the GitHub Actions workflow for deploying infrastructure and running application scripts.
- `python/data_processing.py`: A Python script for processing data, including downloading, filtering products, uploading to S3, and printing its content.
- `terraform/`: Contains Terraform modules and environment-specific configurations.
  - `environments/dev/`: Terragrunt configurations for the `dev` environment.
  - `modules/`: Reusable Terraform modules for CloudFront (`cloudfront`) and S3 (`s3`).

## Prerequisites

Before using this repository, you must have the following installed:
- Terraform
- Terragrunt
- AWS CLI
- Configured AWS credentials with the necessary permissions

## Usage

To deploy the infrastructure:
1. Set your environment variables in `terraform/.env`.
2. Use Terragrunt commands in `terraform/environments/dev/` to initialize and apply configurations.

The GitHub Actions workflow will automatically deploy changes pushed to the `main` branch.

## Environment Variables

Ensure the following mandatory environment variables are defined in your `terraform/.env` file:

| Variable Name | Ex. Value                   | Description                   | Mandatory |
|---------------|-------------------------|-------------------------------|:---------:|
| `p81ENV`      | `dev08`                 | The environment identifier for the project. | Yes |
| `AWS_REGION`  | `us-east-1`             | The AWS region where resources will be deployed. | Yes |


## Notes

- The Terraform state is managed in an S3 bucket using Terragrunt.
- Ensure AWS credentials are set up correctly as GitHub Actions secrets to allow Terraform and the python code to access your AWS account.

## Future Improvements

- Implement a script to gracefully destroy the environment, utilizing the AWS CLI to empty the S3 buckets. Terragrunt will manage the resource teardown, while bucket names will be dynamically generated per environment to be empyied and deleted.
- Update CI/CD workflows and dependencies to address deprecations and transition to Node.js 20, ensuring compliance with the latest GitHub Actions requirements.

## Contact

For any queries or feedback, please contact me:

- **Alon Carmelly**
  - 📧 Email: alon212@gmail.com
