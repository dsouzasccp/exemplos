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
variable "resource" {
  type        = map(string)
  description = "Informações do recurso que será criado"
}
variable "vpclink_id" {
  type        = string
  description = "ID do vpc endpoint usado"
}
variable "create_path_2" {
  type        = bool
  default     = false 
  description = "Variável para criar outros paths no mesmo recurso"
}

variable "create_path_3" {
  type        = bool
  default     = false 
  description = "Variável para criar outros paths no mesmo recurso"
}