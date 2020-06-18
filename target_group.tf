resource "aws_lb_target_group" "tf_eks" {
  name = "terraform-eks-nodes"
  port = 31236
  protocol = "HTTP"
  vpc_id = aws_vpc.eks-cluster.id
  target_type = "instance"
}
