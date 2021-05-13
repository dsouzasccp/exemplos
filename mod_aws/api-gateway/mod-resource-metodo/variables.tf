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

variable "vpclink_id" {
  type        = string
  description = "ID do vpc link da do serviço API Gateway da AWS"
}

variable "endpoint" {
  type        = string
  description = "Endpoint do serviço kubernetes que será usado"
}

variable "enable_api_key" {
  type        = bool
  description = "Habilitar o uso de api key no recurso"
}
variable "parent_id" {
  type        = string
  description = "ID do recurso anterior"
}
variable "method" {
  type        = string
  description = "Informações do recurso que será criado"
}
