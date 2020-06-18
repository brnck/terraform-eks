resource "aws_eks_node_group" "eks-cluster" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "eks-cluster"
  node_role_arn   = aws_iam_role.eks-cluster-node.arn
  subnet_ids      = aws_subnet.eks-cluster[*].id

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-cluster-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-cluster-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
