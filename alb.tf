resource "aws_alb" "eks-alb" {
  name            = "eks-alb"
  subnets         = aws_subnet.eks-cluster[*].id
  security_groups = [aws_security_group.eks-cluster.id, aws_security_group.eks-alb.id]
  ip_address_type = "ipv4"

  tags = map(
    "Name", var.cluster_name,
    "kubernetes.io/cluster/${var.cluster_name}", "owned",
  )
}
