resource "aws_db_instance" "prod" {
  identifier        = "prod-db"
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  username = "admin"
  password = local.db_password

  publicly_accessible = false
  skip_final_snapshot = true
  deletion_protection = false
}
