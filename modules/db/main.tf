resource "aws_db_subnet_group" "dbsubnet" {
  name       = "db subnet"
  subnet_ids = var.priv_sub
}

resource "aws_db_instance" "mysql" {
  allocated_storage         = 20
  engine                    = "mysql"
  engine_version            = "5.7.44"
  instance_class            = "db.t3.micro"
  username                  = "admin"
  password                  = var.DBPass
  parameter_group_name      = "default.mysql5.7"
  multi_az                  = true
  vpc_security_group_ids    = [var.db_sg_id]
  db_subnet_group_name      = aws_db_subnet_group.dbsubnet.name
  skip_final_snapshot       = true
  final_snapshot_identifier = "my-final-snapshot"


}
