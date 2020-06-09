resource "aws_internet_gateway" "brnck" {
  vpc_id = aws_vpc.brnck.id
}
