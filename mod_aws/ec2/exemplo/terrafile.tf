module "instance" {
    source          = "../"
    count           = var.num_instances
    name            = "${var.name}-${var.env}"
    env             = var.env
    instance_type   = var.instance_type
    ami_id          = data.aws_ami.ami.id
    create_volume   = var.create_volume
    volume_size     = var.volume_size
    key_pair        = "tvg-${var.env}"
    subnet_private  = var.subnet_private == true ? data.aws_subnet.private.id : data.aws_subnet.public.id
    public_ip       = var.public_ip
    sg              = [module.sg.id]
    tags            = var.tags


}
module "sg" {
    source              = "../../sg/"
    name                = "${var.name}-${var.env}"
    vpc_id              = data.aws_vpc.selected.id
    tags                = var.tags
    port_ingress        = var.port_ingress
                          
}