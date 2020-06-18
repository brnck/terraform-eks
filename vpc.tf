resource "aws_vpc" "eks-cluster" {
  cidr_block = "10.0.0.0/16"

  tags = map(
    "Name", var.cluster_name,
    "kubernetes.io/cluster/${var.cluster_name}", "shared",
  )
}
