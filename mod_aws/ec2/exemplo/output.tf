output "id" {
    value = module.sg.id
}
output "public_ip" {
    value = module.instance.public_ip
}
output "private_ip" {
    value = module.instance.private_ip
}