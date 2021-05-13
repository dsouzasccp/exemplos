module "api-gateway" {
  source          = "../mod-api-gateway"   ## para uso local
  # source          = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-api-gateway?ref=v0.0.12"     # (execução pipeline)
  api_name        = "${var.api_name}-${var.env}"
  env             = var.env
  endpoint_type   = var.endpoint_type
  create_api_key  = var.create_api_key
  stage_name      = var.env
  domain          = var.domain
  path_api        = var.path_api

}

module "api_gateway_resource_1" {
  source              = "../mod-resources-api-gateway"    ## para uso local
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  resource_name       = var.resource["resource1"]
  create_path_2       = var.resource["resource1_create_path_2"]
  create_path_3       = var.resource["resource1_create_path_3"]
  resource_path2      = var.resource["resource1_create_path_2"] ? var.resource["resource1_name_path2"] : null
  resource_path3      = var.resource["resource1_create_path_3"] ? var.resource["resource1_name_path3"] : null
  api_id              = module.api-gateway.api_id
  api-gateway_root_id = module.api-gateway.api_root_id
  endpoint            = var.resource["endpoint_resource1"]
  # authorizer_id       = module.api-gateway.authorizer_id
  enable_api_key      = var.resource["enable_api_key1"]
  vpclink_id          = var.vpclink_id
}

module "api_gateway_resource_2" {
  source              = "../mod-resources-api-gateway"
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  resource_name       = var.resource["resource2"]
  create_path_2       = var.resource["resource2_create_path_2"]
  create_path_3       = var.resource["resource2_create_path_3"]
  resource_path2      = var.resource["resource2_create_path_2"] ? var.resource["resource2_name_path2"] : null
  resource_path3      = var.resource["resource2_create_path_3"] ? var.resource["resource2_name_path3"] : null
  api_id              = module.api-gateway.api_id
  api-gateway_root_id = module.api-gateway.api_root_id
  endpoint            = var.resource["endpoint_resource2"]
  # authorizer_id       = module.api-gateway.authorizer_id
  enable_api_key      = var.resource["enable_api_key2"]
  vpclink_id          = var.vpclink_id
}

module "api_gateway_resource_3" {
  source              = "../mod-resources-api-gateway"
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  resource_name       = var.resource["resource3"]
  create_path_2       = var.resource["resource3_create_path_2"]
  create_path_3       = var.resource["resource3_create_path_3"]
  resource_path2      = var.resource["resource3_create_path_2"] ? var.resource["resource3_name_path2"] : null
  resource_path3      = var.resource["resource3_create_path_3"] ? var.resource["resource3_name_path3"] : null
  api_id              = module.api-gateway.api_id
  api-gateway_root_id = module.api-gateway.api_root_id
  endpoint            = var.resource["endpoint_resource3"]
  # authorizer_id       = module.api-gateway.authorizer_id
  enable_api_key      = var.resource["enable_api_key3"]
  vpclink_id          = var.vpclink_id
}