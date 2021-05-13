resource "aws_instance" "ec2" {
  count                       = var.num_instances
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_pair
  associate_public_ip_address = var.public_ip
  vpc_security_group_ids      = var.sg
  subnet_id                   = var.subnet_private
  monitoring                  = true
  tags                        = var.tags
  # user_data                   = var.user_data == true ? file("userdata.sh") : var.user_data
  user_data                   = var.user_data == true ? file("userdata.sh") : var.kafka_broker == true ? file("broker${count.index + 1}/userdata.sh") : var.user_data

  # root_block_device {
  #   volume_size = var.volume_size
  # }

}
resource "aws_ebs_volume" "volume" {
  count             = var.create_volume ? var.num_instances : 0
  availability_zone = aws_instance.ec2[count.index].availability_zone
  size              = var.create_volume ? var.volume_size : false
  tags              = var.tags
}

resource "aws_volume_attachment" "ebs_att" {
  count       = var.create_volume ? var.num_instances : 0
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume[count.index].id
  instance_id = aws_instance.ec2[count.index].id
}

