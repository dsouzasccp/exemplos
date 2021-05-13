#Security group dos Cluster
resource "aws_security_group" "cluster" {
  name                  = "sg_eks_${var.cluster_name}"
  description           = "Cluster communication with worker nodes"
  vpc_id                = data.aws_vpc.selected.id

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
  }

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    Name                                = "sg-eks-cluster-${var.cluster_name}"
    Environment                         = var.env
    Terraform                           = true
  }
}

resource "aws_security_group_rule" "cluster-ingress-workstation-https" {
  type                      = "ingress"
  description               = "Allow workstation to communicate with the cluster API Server"
  from_port                 = 443
  to_port                   = 443
  protocol                  = "tcp"
  security_group_id         = aws_security_group.cluster.id
  cidr_blocks               = var.private_access_cidrs
}
