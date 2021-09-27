resource "aws_db_subnet_group" "mysql-subnet" {
  name        = "mysql-subnet"
  description = "RDS subnet group"
  subnet_ids  = [aws_subnet.main-private-1.id, aws_subnet.main-public-1.id]
}


resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0.23"
  instance_class         = "db.t2.micro"
  identifier             = "drupal"
  name                   = "drupaldb"
  username               = "admin"
  password               = var.database-pass
  port                   = "3306"
  db_subnet_group_name   = aws_db_subnet_group.mysql-subnet.name
  multi_az               = "false"
  vpc_security_group_ids = [aws_security_group.allow-mysql.id]
  storage_type           = "gp2"
#  availability_zone      = aws_subnet.main-private-1.availability_zone
  skip_final_snapshot    = true
  tags = {
    Name = "mysql-instance"
  }
}
