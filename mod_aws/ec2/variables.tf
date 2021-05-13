variable "name" {
    type = string
}
variable "env" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "ami_id" {
    type = string
}
variable "key_pair" {
    type = string
}
variable "sg" {
    type = list
    default = []
}
variable "subnet_private" {
    type = string
}
variable "public_ip" {
    type = bool
}
variable "create_volume" {
    type = bool
}
variable "volume_size" {
    type = string
}
variable "tags" {
    description = "A map of tags to add to all resources."
    type        = map(string)
}
variable "user_data" {
    type    = bool
    default = false
}
variable "num_instances" {
    type = string
}
variable "kafka_broker" {
    type    = bool
    default = false
}