terraform {
  backend "s3" {
    bucket         = "terraform-state-company-prod"
    key            = "networking/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
