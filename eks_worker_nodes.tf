resource "aws_eks_node_group" "eks_cluster" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks_cluster"
  node_role_arn   = aws_iam_role.eks_cluster_node.arn
  subnet_ids      = aws_subnet.eks_cluster[*].id

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_cluster_node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_cluster_node_AmazonEC2ContainerRegistryReadOnly,
  ]
}
