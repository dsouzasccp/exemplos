module "route53" {
    source   = "../"
    name     = var.name
    env      = var.env
    type     = var.type
    domain   = var.domain
    record   = module.instance.private_ip                          
}