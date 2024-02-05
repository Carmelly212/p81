include {
  path = find_in_parent_folders()
}

locals {
  environment = get_env("p81ENV")
  aws_account_id = get_env("AWS_ACCOUNT_ID")
}

dependency "cloudfront" {
  config_path = "../cloudfront"
  mock_outputs = {
    cloudfront_distribution_id = "cloudfront_distribution_id"
    cloudfront_oai_id = "cloudfront_oai_id"
  }
}
terraform {
  source = "../../../modules//s3"
}

inputs = {
  bucket_name = "alon-p81-${local.environment}-bucket"
  aws_account_id = local.aws_account_id
  cloudfront_distribution_id = "${dependency.cloudfront.outputs.cloudfront_distribution_id}"
  cloudfront_oai_id = "${dependency.cloudfront.outputs.cloudfront_oai_id}"
}
