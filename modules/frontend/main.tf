resource "aws_launch_template" "frontend" {
  name_prefix   = "frontend-"
  image_id      = "ami-00a929b66ed6e0de6"
  instance_type = "t3a.micro"

  key_name               = var.key_name
  network_interfaces {
  associate_public_ip_address = true
  security_groups             = [var.front_sg_id]
}


}
resource "aws_lb" "frontend" {
  name               = "frontend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.pub_sub
}

resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.frontend.arn
  port              = 8080
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}


resource "aws_lb_target_group" "frontend" {
  name     = "frontend-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc
}
