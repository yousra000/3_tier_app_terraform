variable "vpc" {
  description = "The ID Of The VPC"
}

variable "priv_sub" {
  description = "List of public subnet IDs"
}


variable "db_sg_id" {
  description = "List of security group IDs"
}

variable "DBPass" {
  description = "The password for the database"
  type        = string
}
