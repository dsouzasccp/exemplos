variable "api_id" {
  type        = string
  description = "ID da API"
}

variable "api_gateway_root_id" {
  type        = string
  description = "Root ID"
}
variable "parent_id" {
  type        = string
  description = "ID do recurso anterior"
}

variable "resource_name" {
  type        = string
  description = "Informações do recurso que será criado"
}