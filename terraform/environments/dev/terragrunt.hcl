locals {
  environment = get_env("p81ENV")
  relative_path = path_relative_to_include()
  common_tags = {
    Name      = "ProductCloudFront"
    Owner     = "Alon Carmelly" 
    Terraform = "True"
  }
}
# Configure the AWS Provider and the S3 remote state backend for the root module and all child modules
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "alon-state-${local.environment}"
    key            = "${local.relative_path}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
# Generate the provider configuration for the root module
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}
