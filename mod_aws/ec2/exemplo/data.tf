data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["VPC_CORP"]
  }
}
data "aws_subnet" "private" {
  filter {
    name   = "tag:Name"
    values = ["Private_A_CORP"]
  }
}
data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["Public_A_CORP"]
  }
}
data "aws_ami" "ami" {
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.*"]
  }
  most_recent = true
  owners      = ["amazon"]
}
