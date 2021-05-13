# Api-Gateway e Recursos

Esse projeto provisiona um api gateway na AWS e a criação de recursos.
O projeto usa como base o repositório de modulos `https://gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws`

## Usage

Para criar a API e os recursos no ambiente de `dev`, rodar a pipeline na branch `develop`
Para criar a API e os recursos no ambiente de `qa`, rodar a pipeline na branch `master`
Para criar a API e os recursos no ambiente de `prod`, criar uma `TAG` na branch `master`

Para criação de novo recurso, adicionar um novo recurso no arquivo `tfvars/env.tfvars` conforme imagem abaixo: 

```terraform
resource      = {
  "name_resource1"      = "recurso-um"
  "endpoint_resource1"  = "https://ingress.dev.negocios.globo/path-ingress/{proxy}"

  "name_resource2"      = "resource-dois"
  "endpoint_resource2"  = "https://ingress.dev.negocios.globo/path-ingress/{proxy}"
}
```

Adicionar também o bloco para criação do novo recurso conforme imagem abaixo:

```terraform
module "api_gateway_resource_2" {
  source              = "git::https://terraform:7jFzATYVXeYB1mVxqbNN@gitlab.globoi.com/adtech/devops/terraform-modules/mod-aws.git//api-gateway//mod-resources-api-gateway?ref=v0.0.10"
  resource_name       = var.resource["name_resource2"]
  api_id              = module.api-gateway.api_id
  api-gateway_root_id = module.api-gateway.api_root_id
  endpoint            = var.resource["endpoint_resource2"]
  # authorizer_id       = module.api-gateway.authorizer_id
  vpclink_id          = var.vpclink_id
}
```

##### name_resource1 - Nome do novo recurso que será criado na API.
##### endpoint_resource1 - Endereço do ingress que a API redirecionará o tráfego.


# Melhorias
Incluir opção de autorização e autenticação no módulo