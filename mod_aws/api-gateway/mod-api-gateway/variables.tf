variable "api_name" {
  description = "Nome da API que será criada"
  type        = string
}
variable "endpoint_type" {
  description = "Tipo do endpoint de API"
  type        = string
}
# variable "create_api_key" {
#   description = "Cria api key"
#   type        = bool
# }
variable "stage_deploy" {
  type    = string
  description = "Nome do stage de deploy"
}
variable "env" {
  type    = string
  description = "Ambiente que a API será criada"
}
variable "domain" {
  description = "Dominio que será usado"
  type        = string
}
variable "path_api" {
  description = "path que será usado para as chamadas dos recursos das APIs"
  type        = string
}
