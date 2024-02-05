# include the module from the parent folder
include {
  path = find_in_parent_folders()
}
# define the locals
locals {
  environment = get_env("p81ENV")
  region = get_env("AWS_REGION")
  tags = {
    Name      = "ProductCloudFront"
    Owner     = "Alon Carmelly" 
    Terraform = "True"
  }
}
# define the module
terraform {
  source = "../../../modules//cloudfront"
}
# define the inputs
inputs = {
  origin_domain_name = "alon-p81-${local.environment}-bucket.s3.${local.region}.amazonaws.com"
  origin_id = "alon-p81-${local.environment}-bucket"
  tags = local.tags
}


