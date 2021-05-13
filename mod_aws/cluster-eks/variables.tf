variable "region" {
    type = string
    description = "Região onde será deployado o cluster de eks."
    default = "us-east-1"
}
variable "cluster_name" {
    type        = string
    description = "O nome do seu cluster, esse será interpolado com a variabel 'env'."
    default     = "cluster-apps"
}
variable "env" {
    type        = string
    description = "Variável do tipo de ambiente do cluster."
    default     = "dev"
}
variable "tags" {
  description = "Um map de tags para serem adicionadas em todos os recursos."
  type        = map(string)
  
  default     = {
    costcenter   = "negocios"
    cod_activity = "00000"
    region       = "us-east-1"
    product      = "aparecenaglobo"
    owner        = "owner"
    Terraform    = "true"
  }
}
variable "instance_type" {
    type        = list(string)
    description = "Tipo de instância para os seus workers nodes."
    default     = ["t3.xlarge"]
}
variable "disk_size" {
    type        = string
    description = "Tamanho do volume das instâncias do node"
    default     = "30"
}
variable "eks_version" {
    type        = string
    description = "Versão do cluster EKS e do grupo de worker nodes."
    default     = "1.14"
}

variable "auto_scale_options" {
  description = "Um map de opções para o node group."
  type        = map
  
  default = {
    min     = 1
    desired = 1
    max     = 10

  }
}
variable "account_adtech" {
    type        = bool
    description = "Variável para ser deployado na conta LandingZone ou não."
    default     = false
}