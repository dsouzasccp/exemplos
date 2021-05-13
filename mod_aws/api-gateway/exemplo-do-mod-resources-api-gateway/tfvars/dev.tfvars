### API ###
api_name        = "Teste"
endpoint_type   = "REGIONAL"
create_api_key  = true
env             = "dev"
domain          = "negocios.globo"
path_api        = "parh_teste"

### Resources ###
vpclink_id    = "qcr4s2"
resource      = {
  "resource1"               = "resource_teste1"
  "resource1_create_path_2" = true
  "resource1_create_path_3" = true
  "resource1_name_path2"    = "resource_teste2"
  "resource1_name_path3"    = "resource_teste3"
  "endpoint_resource1"      = "https://ingress.dev.negocios.globo/teste/{proxy}"
  "enable_api_key1"         = true

  "resource2"               = "resource-dois"
  "resource2_create_path_2" = false
  "resource2_create_path_3" = false
  "resource2_name_path2"    = "resource_dois2"
  "resource2_name_path3"    = "resource_dois3"
  "endpoint_resource2"      = "https://ingress.dev.negocios.globo/path/{proxy}"
  "enable_api_key2"         = false

  "resource3"               = "resource-tres"
  "resource3_create_path_2" = true
  "resource3_create_path_3" = false
  "resource3_name_path2"    = "resource_tres2"
  "resource3_name_path3"    = "resource_tres3"
  "endpoint_resource3"      = "https://ingress.dev.negocios.globo/path1/{proxy}"
  "enable_api_key3"         = false
}