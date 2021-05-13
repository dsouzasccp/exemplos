# resource "time_sleep" "wait_3_min" {
#   create_duration = "3m"
# }
resource "aws_eks_node_group" "workers" {
    # depends_on      = [time_sleep.wait_3_min]
    cluster_name    = var.cluster_name
    node_group_name = var.node_name
    node_role_arn   = aws_iam_role.nodes.arn
    version         = var.eks_version

    subnet_ids      = data.aws_subnet_ids.selected.ids

    instance_types  = var.instance_type
    disk_size       = var.disk_size

    scaling_config {
        desired_size = lookup(var.auto_scale_options, "desired")
        max_size     = lookup(var.auto_scale_options, "max")
        min_size     = lookup(var.auto_scale_options, "min")
    }

    remote_access {
        ec2_ssh_key                 = var.key_pair
        source_security_group_ids   = [aws_security_group.allow_access_ssh.id]
    }

    # labels = {
    #     Name = "teste"
    # }

    tags = {
        Name                                        = "${var.cluster_name}-v${var.eks_version}"
        version                                     = format("node-group-%s-v%s", var.cluster_name, var.eks_version)
        "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
}