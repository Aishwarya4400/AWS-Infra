resource "aws_alb" "my-elb" { #aws_lb
  name            = "my-elb"
  internal        = false
  subnets         = [aws_subnet.main-public-1.id, aws_subnet.main-private-1.id]
  security_groups = [aws_security_group.elb-securitygroup.id]

}

resource "aws_alb_target_group" "test" { #aws_alb_target_group
  name     = "lb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  stickiness {
    type = "lb_cookie"
  }
}
resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = "${aws_alb.my-elb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = "${aws_alb_target_group.test.arn}"
    type             = "forward"
  }
}

