resource "aws_security_group" "brnck-cluster" {
  name        = "terraform-eks-brnck-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.brnck.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
