variable "api_key_name" {
  description = "Nome da API_KEY que será criada"
  type        = string
}
variable "stage_name" {
  type        = string
  description = "Nome do stage de deploy"
}
variable "api_id" {
  type        = string
  description = "ID da API"
}
variable "api_key_value" {
    type        = string
    description = "hash da api key"
}