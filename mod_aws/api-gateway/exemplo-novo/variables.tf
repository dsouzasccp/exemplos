### API ###
variable "api_name" {
  type        = string
  description = "Nome da API que será criada"
}
variable "endpoint_type" {
  type        = string
  description = "Tipo do endpoint de API"
}
variable "create_api_key" {
  type        = bool
  description = "Cria api key"
}
variable "env" {
  type        = string
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


### Resources ###
variable "name_resources_main" {
  description = "Informações do recurso que será criado"
  type = list(string)
}
variable "num_resource_main" {
  type    = number
}
variable "vpclink_id" {
  type        = string
  description = "ID do vpc endpoint usado"
}

### Api Key ###
variable "hash_api_key" {
  type        = list(string)
  description = "Lista de keys que serão usadas"
}