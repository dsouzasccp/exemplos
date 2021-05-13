### API ###
api_name        = "Teste"
endpoint_type   = "REGIONAL"
create_api_key  = true
env             = "prd"
domain          = "negocios.globo"
path_api        = "parh_teste"
path_2          = false
path_3          = false


### Resources ###
vpclink_id    = "ln2b61"
resource      = {
  "name_resource1"      = "resource_teste1"
  "endpoint_resource1"  = "https://ingress.prd.negocios.globo/teste/{proxy}"
  "enable_api_key1"     = true

  # "name_resource2"      = "resource-dois"
  # "endpoint_resource2"  = "https://ingress.prd.negocios.globo/path/{proxy}"
}