module "api_gateway" {
  source          = "../mod-api-gateway"   ## para uso local
  # source          = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-api-gateway?ref=v0.0.12"     # (execução pipeline)
  api_name        = "${var.api_name}-${var.env}"
  env             = var.env
  endpoint_type   = var.endpoint_type
  # create_api_key  = var.create_api_key
  stage_deploy    = var.env
  domain          = var.domain
  path_api        = var.path_api
}

module "api_key_pricing_siscom" {
  source          = "../mod-api-key"   ## para uso local
  # source          = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-api-key?ref=v0.0.12"     # (execução pipeline)
  api_key_name    = "teste_pricing_siscom_${var.env}"
  stage_name      = module.api_gateway.stage_deploy
  api_id          = module.api_gateway.api_id
  api_key_value   = var.hash_api_key[0]   ## esse valor deve ser diferente para cada ambiente
}

module "api_key_pricing_midia_mais" {
  source          = "../mod-api-key"   ## para uso local
  # source          = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-api-key?ref=v0.0.12"     # (execução pipeline)
  api_key_name    = "teste_pricing_midia_mais_${var.env}"
  stage_name      = module.api_gateway.stage_deploy
  api_id          = module.api_gateway.api_id
  api_key_value   = var.hash_api_key[1]    ## esse valor deve ser diferente para cada ambiente
}

module "resource_main" {
  source              = "../mod-resource-main"    ## para uso local
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  num_resource        = var.num_resource_main
  resource_name       = var.name_resources_main
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
}

module "sub_resource" {
  source              = "../mod-resource-sub"    ## para uso local
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  resource_name       = "sub_recurso"
  parent_id           = module.resource_main.resource_main_id[0]
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
}

module "sub_resource_proxy" {
  source              = "../mod-resource-proxy"
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  parent_id           = module.sub_resource.sub_resource_id
  endpoint            = "https://ingress.dev.negocios.globo/path/{proxy}"
  enable_api_key      = true
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
  # authorizer_id       = module.api_gateway.authorizer_id
  vpclink_id          = var.vpclink_id
}

module "sub_resource1" {
  source              = "../mod-resource-sub"    ## para uso local
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  resource_name       = "sub_recurso1"
  parent_id           = module.resource_main.resource_main_id[1]
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
}

module "sub_resource1_proxy" {
  source              = "../mod-resource-proxy"
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  parent_id           = module.sub_resource1.sub_resource_id
  endpoint            = "https://ingress.dev.negocios.globo/path1/{proxy}"
  enable_api_key      = true
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
  # authorizer_id       = module.api_gateway.authorizer_id
  vpclink_id          = var.vpclink_id
}

module "sub_resource2" {
  source              = "../mod-resource-sub"    ## para uso local
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  resource_name       = "sub_recurso2"
  parent_id           = module.resource_main.resource_main_id[2]
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
}


module "sub_resource2_proxy" {
  source              = "../mod-resource-proxy"
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  parent_id           = module.sub_resource2.sub_resource_id
  endpoint            = "https://ingress.dev.negocios.globo/path2/{proxy}"
  enable_api_key      = true
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
  # authorizer_id       = module.api_gateway.authorizer_id
  vpclink_id          = var.vpclink_id
}

module "sub_resource3" {
  source              = "../mod-resource-sub"    ## para uso local
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  resource_name       = "sub_recurso"
  parent_id           = module.resource_main.resource_main_id[3]
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
}

module "sub_resource2_get" {
  source              = "../mod-resource-metodo"
  # source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.12"     # (execução pipeline)
  method              = "POST"
  parent_id           = module.sub_resource3.sub_resource_id
  endpoint            = "https://ingress.dev.negocios.globo/path3/{proxy}"
  enable_api_key      = true
  api_id              = module.api_gateway.api_id
  api_gateway_root_id = module.api_gateway.api_root_id
  # authorizer_id       = module.api_gateway.authorizer_id
  vpclink_id          = var.vpclink_id
}