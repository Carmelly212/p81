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

## GitHub Actions Secrets

For the GitHub Actions workflow to function correctly, certain secrets must be set in the repository's settings. These secrets enable the workflow to interact with AWS services securely.

### Required Secrets

Make sure the following secrets are defined in the GitHub Actions settings of your repository:

| Secret Name             | Description |
|-------------------------|-------------|
| `AWS_ACCESS_KEY_ID`     | The access key for your AWS IAM user. |
| `AWS_SECRET_ACCESS_KEY` | The secret access key for your AWS IAM user. |
| `AWS_ACCOUNT_ID`        | Your AWS account ID. |

### Setting Secrets

To set these secrets:

1. Go to your GitHub repository.
2. Click on `Settings` > `Secrets and variables` > `Actions`.
3. Click on `New repository secret`.
4. Add each of the above secrets one by one.

### Usage in GitHub Actions

These secrets are utilized in the `.github/workflows/main.yml` file to configure AWS CLI and authenticate Terraform for infrastructure deployment and management. The secrets are injected as environment variables and are not logged or exposed during the execution of the GitHub Actions workflow.


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

- Refactor Terragrunt configurations to adhere to DRY principles, minimizing repetition of environment variables and tags across child modules.
- Implement a script to gracefully destroy the environment, utilizing the AWS CLI to empty the S3 buckets. Terragrunt will manage the resource teardown, while bucket names will be dynamically generated per environment to be empyied and deleted.
- Update CI/CD workflows and dependencies to address deprecations and transition to Node.js 20, ensuring compliance with the latest GitHub Actions requirements.

## Contact

For any queries or feedback, please contact me:

- **Alon Carmelly**
  - 📧 Email: alon212@gmail.com
