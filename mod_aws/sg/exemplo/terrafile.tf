module "sg" {
    source              = "../"
    name                = "${var.name}-${var.env}"
    vpc_id              = data.aws_vpc.selected.id
    tags                = var.tags
    port_ingress        = var.port_ingress
                          
}