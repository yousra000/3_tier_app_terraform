output "vpc" {
  value = aws_vpc.vpc.id
}

output "pub_sub" {
  value = aws_subnet.pub_sub[*].id  
}

output "priv_sub" {
  value = aws_subnet.priv_sub[*].id 
}