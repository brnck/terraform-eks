resource "aws_internet_gateway" "eks_cluster" {
  vpc_id = aws_vpc.eks_cluster.id

  tags = {
    Name = var.cluster_name
  }
}
