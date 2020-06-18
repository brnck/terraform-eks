resource "aws_route_table_association" "eks-cluster" {
  count = 2

  subnet_id      = aws_subnet.eks-cluster.*.id[count.index]
  route_table_id = aws_route_table.eks-cluster.id
}
