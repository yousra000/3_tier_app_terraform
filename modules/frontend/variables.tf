variable "pub_sub" {
  description = "List of private subnet IDs"
}

variable "key_name" {
  description = "The name of the SSH key pair"
}

variable "vpc" {
  description = "The ID Of The VPC"
}

variable "front_sg_id" {
  description = "The Security Group Of The Load Balancer"
}
variable "alb_sg_id" {
  description = "The Security Group Of The Load Balancer"
}
