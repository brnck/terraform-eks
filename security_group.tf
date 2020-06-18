resource "aws_security_group" "eks-cluster" {
  name        = "terraform-eks-eks-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.eks-cluster.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "eks-alb" {
  name        = "eks-alb-public"
  description = "Security group allowing public traffic for the eks load balancer."
  vpc_id      = aws_vpc.eks-cluster.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow eks load balancer to communicate with public traffic."
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = map(
    "Name", var.cluster_name,
    "kubernetes.io/cluster/${var.cluster_name}", "owned",
  )
}
