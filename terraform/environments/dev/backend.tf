# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "alon-state-dev02"
    encrypt = true
    key     = "./terraform.tfstate"
    region  = "us-east-1"
  }
}