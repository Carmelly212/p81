# include the module from the parent folder
include {
  path = find_in_parent_folders()
}
# define the locals
locals {
  environment = get_env("p81ENV")
  aws_account_id = get_env("AWS_ACCOUNT_ID")
}
# dependency on the cloudfront module and mock the outputs so we can use them in the s3 module
dependency "cloudfront" {
  config_path = "../cloudfront"
  mock_outputs = {
    cloudfront_distribution_id = "cloudfront_distribution_id"
    cloudfront_oai_id = "cloudfront_oai_id"
  }
}
# include the s3 module
terraform {
  source = "../../../modules//s3"
}
# inputs for the s3 module
inputs = {
  bucket_name = "alon-p81-${local.environment}-bucket"
  aws_account_id = local.aws_account_id
  cloudfront_distribution_id = "${dependency.cloudfront.outputs.cloudfront_distribution_id}"
  cloudfront_oai_id = "${dependency.cloudfront.outputs.cloudfront_oai_id}"
  tags = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl")).locals.common_tags
}
