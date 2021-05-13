#### Descomentar esse bloco para usar no seu projeto ####
# provider "aws" {
#   region      = "us-east-1"
#   version     = "~> 3.27.0"
#   access_key  = "#access_key#"
#   secret_key  = "#secret_key#"
#   # profile     = "adtech-dev"
# }
# terraform {
#   backend "s3" {
#     bucket      = "usg-terraform-states-#env#"
#     access_key  = "#access_key#"
#     secret_key  = "#secret_key#"
#     key         = "api-gateway/decoupling-api-#env#.tfstate"
#     region      = "us-east-1"
#     encrypt     = true
#     # profile     = "adtech-dev"
#     # bucket      = "usg-terraform-states-dev"
#   }
# }


#### para usar localmente para teste ####
provider "aws" {
  region      = "us-east-1"
  version     = "~> 3.27.0"
  profile     = "adtech-dev"
}
terraform {
  backend "s3" {
    key         = "api-gateway/teste-api-dev.tfstate"
    region      = "us-east-1"
    encrypt     = true
    profile     = "adtech-dev"
    bucket      = "usg-terraform-states-dev"
  }
}