# variable "resource_name" {
#   type        = string
#   description = "Nome do recurso que será criado"
# }
variable "api_id" {
  type        = string
  description = "ID da API"
}

variable "api_gateway_root_id" {
  type        = string
  description = "Root ID"
}

# variable "authorizer_id" {
# }

variable "num_resource" {
  type    = number
}

variable "resource_name" {
  type        = list(string)
  description = "Informações do recurso que será criado"
}