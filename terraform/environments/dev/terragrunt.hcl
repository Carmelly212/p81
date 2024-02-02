locals {
  # Get the relative path from the include
  relative_path = path_relative_to_include()

  # Split the path by '/' to get parent folder name as env name
  environment = split("/", local.relative_path)[length(split("/", local.relative_path)) - 2]
}

#  S3 Remote state configuration 
remote_state {
  backend = "s3"
  config = {
    bucket  = "state-${local.environment}-p81"
    key     = "${local.relative_path}/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}


# Terraform module for S3 bucket
terraform {
  source = "../../../modules/s3"
}

# Terraform module for CloudFront
terraform {
  source = "../../../modules/cloudfront"
}

inputs = {
  bucket_name = "p81-${local.environment}-bucket"
  
}

inputs = {
  # for cloudfront
}
