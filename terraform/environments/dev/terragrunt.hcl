# /terraform/environments/dev/terragrunt.hcl

locals {
  environment = get_env("p81ENV")
  relative_path = path_relative_to_include()
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "tg-state-alon-${local.environment}"
    key            = "${local.relative_path}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
