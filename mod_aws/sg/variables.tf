variable "name" {
    type = string
}
variable "vpc_id" {
    type = string
}
variable port_ingress {
  description = "Lista de portas inbound"
  type        = map(object({description = string, cidr_blocks = list(string)}))
  default     = {}
}
variable "tags" {
  description = "Lista de tags para adicionar aos recursos."
  type        = map(string)
}
