variable "front_lt_id" {
  description = "The ID of the Frontend launch template"
}

variable "pub_sub" {
  description = "List of public subnet IDs"
}

variable "front_aws_lb_target_group_arn" {
  description = "The ARN of the FrontEnd Application Load Balancer target group"
}

variable "backend_lt_id" {
  description = "The ID of the Backend launch template"
}

variable "priv_sub" {
  description = "List of private subnet IDs"
}

variable "backend_aws_lb_target_group_arn" {
  description = "The ARN of the BackEnd Application Load Balancer target group"
}
