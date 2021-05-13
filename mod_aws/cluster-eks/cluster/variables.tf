variable "account_adtech" {
    type    = bool
}
variable "cluster_name" {
    type = string
}
variable "env" {
    type = string
}
variable "eks_version" {
    type    = string
}
variable "tags" {
    type        = map(string)
    description = "Um map de tags para adicionar a todos os recursos."
}
variable "private_access_cidrs" {
    type        = list(string)
    default     = ["10.0.0.0/8"]
}