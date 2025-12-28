terraform {
  backend "s3" {
    bucket         = "terraform-bucket-secret"
    key            = "rds/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

