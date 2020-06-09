resource "aws_route_table_association" "brnck" {
  count = 2

  subnet_id      = aws_subnet.brnck.*.id[count.index]
  route_table_id = aws_route_table.brnck.id
}
