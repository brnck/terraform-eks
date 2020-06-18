resource "aws_internet_gateway" "eks-cluster" {
  vpc_id = aws_vpc.eks-cluster.id

  tags = {
    Name = var.cluster_name
  }
}
