# /dev/s3/terragrunt.hcl
# child 
locals {
  environment = get_env("p81ENV")
}
terraform {
  source = "../../../modules//s3"
}

inputs = {
  bucket_name = "alon-${local.environment}-bucket"
  # Other inputs specific to the S3 module
}
