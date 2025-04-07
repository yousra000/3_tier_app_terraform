output "backend_alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.backend.dns_name
}
output "backend_alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.backend.arn
}

output "backend_lt_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.backend.id
}

output "backend_aws_lb_target_group_arn" {
  description = "The ARN of the BackEnd Application Load Balancer target group"
  value       = aws_lb_target_group.backend.arn
}
