provider "aws" {
  region  = "us-east-1"
  version = "~> 2.8"
  # profile = "<profile-aws>"
  profile = "adtech-dev"
}

terraform {
  backend "s3" {
    bucket  = "tvg-terraform-states-dev"
    key     = "ec2/exemplo.tfstate"
    region  = "us-east-1"
    # profile = "<profile-aws>"
    profile = "adtech-dev"
    encrypt = true
  }
}