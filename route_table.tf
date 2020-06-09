resource "aws_route_table" "brnck" {
  vpc_id = aws_vpc.brnck.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.brnck.id
  }
}
