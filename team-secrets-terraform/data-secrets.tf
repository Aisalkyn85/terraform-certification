data "aws_secretsmanager_secret" "db" {
  name = "prod/rds/db_password"
}

data "aws_secretsmanager_secret_version" "db" {
  secret_id = data.aws_secretsmanager_secret.db.id
}

locals {
  db_password = jsondecode(data.aws_secretsmanager_secret_version.db.secret_string)["password"]
}

