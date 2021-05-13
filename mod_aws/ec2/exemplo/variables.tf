variable "name" {
    description = "Nome dos recursos que serão criados"
    type        = string
    default     = "Exemplo"
}
variable "env" {
    description = "Tipo de ambiente"
    type        = string
    default     = "dev"
}
variable "instance_type" {
    description = "Tipo de instância que deseja usar"
    type        = string
    default     = "t3.small"
}
variable "create_volume" {
    description = "Cria um volume secundário"
    type        = bool
    default     = true
}
variable "volume_size" {
    description = "Tamanho do disco secundário."
    type        = string
    default     = "30"
}
variable "num_instances" {
    description = "Quantidade de instancias que serão criadas"
    type        = string
    default     = "1"
}
variable "subnet_private" {
    description = "Subnet privada?"
    type        = bool
    default     = true
}
variable "public_ip" {
    description = "Incluir IP público na instância?"
    type        = bool
    default     = false
}
variable port_ingress {
  description = "Lista de portas inbound"
  type        = map(object({description = string, cidr_blocks = list(string)}))
  default     = { 22  = { description = "Port SSH", cidr_blocks = [ "10.0.0.0/8" ] },
                  80  = { description = "Port HTTP", cidr_blocks = [ "0.0.0.0/0" ] },
                  443 = { description = "Port HTTPS", cidr_blocks = [ "0.0.0.0/0" ] }
                }
}
variable "tags" {
  description = "Lista de tags para adicionar aos recursos"
  type        = map(string)
  default     = { Name         = "Exemplo",
                  environment  = "dev",
                  region       = "us-east-1", 
                  costcenter   = "DLO",
                  cod_activity = "00000",
                  product      = "Operative",
                  owner        = "DLO-Central-Exibicao",
                  Terraform    = "true"
                }
}
