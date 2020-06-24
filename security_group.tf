resource "aws_security_group" "eks_cluster" {
  name        = "eks_cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.eks_cluster.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
