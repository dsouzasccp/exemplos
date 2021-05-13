variable "account_adtech" {
    type    = bool
}
variable "cluster_name" {
    type = string
}
variable "node_name" {
    type = string
}
variable "instance_type" {
    type = list(string)
}
variable "disk_size" {
    type = string
}
variable "env" {
    type = string
}
variable "tags" {
    type        = map(string)
    description = "Um map de tags para adicionar a todos os recursos."
}
variable "key_pair" {
    type = string
}
variable "eks_version" {
    type    = string
}
variable "auto_scale_options" {
    type    = map
}
variable "private_access_cidrs" {
    type        = list(string)
    default     = ["10.0.0.0/8"]
}