resource "aws_alb_listener" "eks-alb" {
  load_balancer_arn = aws_alb.eks-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_eks.arn
  }
}
