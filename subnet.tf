resource "aws_subnet" "eks_cluster" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.eks_cluster.id

  tags = map(
    "Name", var.cluster_name,
    "kubernetes.io/cluster/${var.cluster_name}", "shared",
  )
}
