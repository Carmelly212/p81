# child 

locals {
  environment = get_env("p81ENV")
}
terraform {
  source = "../../../modules//cloudfront"
}

inputs = {
  origin_domain_name = "alon-${local.environment}-bucket.s3.amazonaws.com"
  origin_id = "S3-alon-${local.environment}-bucket"
}
