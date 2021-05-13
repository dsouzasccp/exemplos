data "aws_subnet_ids" "selected" {
  vpc_id    = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = var.account_adtech ? ["Private_*_CORP"] : ["subnet-private-vpn-*"]
  }
}
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = var.account_adtech ? ["VPC_CORP"] : ["vpc-cluster-apps"]
  }
}
# data "aws_ami" "eks-worker" {
#   filter {
#     name   = "name"
#     # values = ["amazon-eks-node-*"]
#     values = ["amazon-eks-node-${var.eks_version}-*"]
#   }

#   most_recent = true
#   owners      = ["amazon"] # Amazon Account ID 602401143452
# }