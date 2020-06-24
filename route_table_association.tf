resource "aws_route_table_association" "eks_cluster" {
  count = 2

  subnet_id      = aws_subnet.eks_cluster.*.id[count.index]
  route_table_id = aws_route_table.eks_cluster.id
}
