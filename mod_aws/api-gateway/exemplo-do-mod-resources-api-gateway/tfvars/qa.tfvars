### API ###
api_name        = "Teste"
endpoint_type   = "REGIONAL"
create_api_key  = true
env             = "qa"
domain          = "negocios.globo"
path_api        = "parh_teste"
path_2          = true
path_3          = true

### Resources ###
vpclink_id    = "vfbllv"
resource      = {
  "name_resource1"      = "resource_teste1"
  "endpoint_resource1"  = "https://ingress.qa.negocios.globo/teste/{proxy}"
  "enable_api_key1"     = true

#   "name_resource2"      = "resource-dois"
#   "endpoint_resource2"  = "https://ingress.qa.negocios.globo/path/{proxy}"
}
