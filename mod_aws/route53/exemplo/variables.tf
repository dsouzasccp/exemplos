variable "name" {
  description = "Nome dos recursos que serão criados"
  type        = string
  default     = "Exemplo"
}
variable "env" {
  description = "Tipo de ambiente" #valores permitidos dev, qa ou prd
  type        = string
  default     = "dev"
}
variable "type" {
  description = "Tipo de ambiente" #valores permitidos CNAME ou A
  type        = string
  default     = "A"
}
variable "domain" {
  description = "Nome do domínio que será usado"
  type        = string
  default     = "negocios.globo"
}
