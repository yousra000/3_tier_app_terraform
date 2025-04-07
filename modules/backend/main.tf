resource "aws_launch_template" "backend" {
  name_prefix   = "backend-"
  image_id      = "ami-00a929b66ed6e0de6"
  instance_type = "t3a.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [var.back_sg_id]

}
resource "aws_lb" "backend" {
  name               = "backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.priv_sub
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.backend.arn
  port              = 8080
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
}


resource "aws_lb_target_group" "backend" {
  name     = "backend-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc
}
