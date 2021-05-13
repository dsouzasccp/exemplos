# resource "time_sleep" "wait_3_min" {
#   destroy_duration = "3m"
# }
resource "aws_eks_cluster" "cluster" {
  name            = var.cluster_name
  role_arn        = aws_iam_role.cluster.arn
  version         = var.eks_version

  vpc_config {
    security_group_ids = [aws_security_group.cluster.id]
    subnet_ids         = data.aws_subnet_ids.selected.ids
  }

  depends_on = [
    # time_sleep.wait_3_min,
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKSServicePolicy
  ]

  tags                  = var.tags

}










