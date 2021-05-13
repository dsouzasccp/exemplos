#Role dos Nodes
data "aws_iam_policy_document" "eks_nodes_role" {
  
    version = "2012-10-17"

    statement {

        actions = [ "sts:AssumeRole" ]

        principals {
            type = "Service"
            identifiers = [
                "ec2.amazonaws.com"
            ]
        }

    }

}
resource "aws_iam_role" "nodes" {
    name = "role-nodes-${var.cluster_name}-${var.eks_version}"
    assume_role_policy = data.aws_iam_policy_document.eks_nodes_role.json
}

resource "aws_iam_role_policy_attachment" "node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes.name
}
resource "aws_iam_role_policy_attachment" "node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes.name
}
resource "aws_iam_role_policy_attachment" "node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes.name
}
resource "aws_iam_role_policy_attachment" "node-AmazonEC2FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "node-CloudWatchFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = aws_iam_role.nodes.name
}

# resource "aws_iam_role_policy_attachment" "node-AmazonDynamoDBFullAccess" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
#   role       = aws_iam_role.nodes.name
# }

resource "aws_iam_role_policy_attachment" "node-CloudFrontFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
  role       = aws_iam_role.nodes.name
}

# resource "aws_iam_role_policy_attachment" "node-AmazonSQSFullAccess" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
#   role       = aws_iam_role.nodes.name
# }

resource "aws_iam_role_policy_attachment" "node-AmazonS3FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "node-AmazonSesFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "node-AmazonRDSFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  role       = aws_iam_role.nodes.name
}

# resource "aws_iam_role_policy_attachment" "node-AmazonRoute53FullAccess" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
#   role       = aws_iam_role.nodes.name
# }
