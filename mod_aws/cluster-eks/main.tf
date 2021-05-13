###### Conta negociosdev ######
provider "aws" {
  region  = var.region
  version = "~> 2.8"
  # profile = "negociosdev"
  access_key = "#access_key#"
  secret_key = "#secret_key#"
}
terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "tvg-terraform-states"
    key     = "eks/node-group-teste.tfstate"
    profile = "negociosdev"
    encrypt = true
  }
}

###### Conta adtech-dev ######
# provider "aws" {
#   region  = var.region
#   version = "~> 2.8"
#   # profile = "adtech-dev"
#   access_key = "#access_key#"
#   secret_key = "#secret_key#"
# }
# terraform {
#   backend "s3" {
#     region  = "us-east-1"
#     bucket  = "tvg-terraform-states-dev"
#     key     = "eks/node-group-teste-1.14.tfstate"
#     profile = "adtech-dev"
#     encrypt = true
#   }
# }