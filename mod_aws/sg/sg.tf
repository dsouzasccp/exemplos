resource "aws_security_group" "sg" {
  name        = "sg_${var.name}"
  description = "SG ${var.name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.port_ingress
    content {
      description = ingress.value["description"]
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags  =  var.tags
}
