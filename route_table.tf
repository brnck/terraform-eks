resource "aws_route_table" "eks_cluster" {
  vpc_id = aws_vpc.eks_cluster.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_cluster.id
  }
}
