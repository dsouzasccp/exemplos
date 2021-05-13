provider "aws" {
  region  = "us-east-1"
  version = "~> 2.8"
  profile = "<profile-aws>"
}

terraform {
  backend "s3" {
    bucket  = "tvg-terraform-states-dev"
    key     = "route53/exemplo.tfstate"
    region  = "us-east-1"
    profile = "<profile-aws>"
    encrypt = true
  }
}