resource "aws_eks_cluster" "brnck" {
  name     = var.cluster_name
  role_arn = aws_iam_role.brnck-cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.brnck-cluster.id]
    subnet_ids         = aws_subnet.brnck[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.brnck-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.brnck-cluster-AmazonEKSServicePolicy,
  ]
}
