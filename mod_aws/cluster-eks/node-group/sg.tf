resource "aws_security_group" "allow_access_ssh" {
  name                  = "sg_node-group_${var.cluster_name}"
  description           = "Allow SSH Access"
  vpc_id                = data.aws_vpc.selected.id

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
  }

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    Name                                = "sg_node-group-${var.cluster_name}"
    Environment                         = var.env
  }
}

resource "aws_security_group_rule" "ingress-ssh-access" {
  description              = "Allow SSH Accesse"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.allow_access_ssh.id
  cidr_blocks              = var.private_access_cidrs
}