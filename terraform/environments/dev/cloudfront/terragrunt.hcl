# child 

locals {
  environment = get_env("p81ENV")
  region = get_env("AWS_REGION")
}
terraform {
  source = "../../../modules//cloudfront"
}

inputs = {
  origin_domain_name = "alon-p81-${local.environment}-bucket.s3.${local.region}.amazonaws.com"
  origin_id = "alon-p81-${local.environment}-bucket"
}


