resource "aws_eks_node_group" "brnck" {
  cluster_name    = aws_eks_cluster.brnck.name
  node_group_name = "brnck"
  node_role_arn   = aws_iam_role.brnck-node.arn
  subnet_ids      = aws_subnet.brnck[*].id

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.brnck-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.brnck-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.brnck-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
