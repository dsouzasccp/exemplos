variable "resource_name" {
  type        = string
  description = "Nome do recurso que será criado"
}
variable "resource_path2" {
  type        = string
  description = "Nome do recurso que será criado"
}
variable "resource_path3" {
  type        = string
  description = "Nome do recurso que será criado"
}
variable "api_id" {
  type        = string
  description = "ID da API"
}

variable "api-gateway_root_id" {
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
variable "create_path_2" {
  type    = bool
}

variable "create_path_3" {
  type    = bool
}

