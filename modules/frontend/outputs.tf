output "front_alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.frontend.dns_name
}
output "front_alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.frontend.arn
}
output "front_lt_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.frontend.id
}

output "front_aws_lb_target_group_arn" {
  description = "The ARN of the FrontEnd Application Load Balancer target group"
  value       = aws_lb_target_group.frontend.arn
}

