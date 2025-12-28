terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # IMPORTANT: First run: keep backend local.
  # After S3/DynamoDB are created, you can configure backend "s3" here if you want.
  # backend "s3" {
  #   bucket         = "REPLACE_WITH_CREATED_BUCKET"
  #   key            = "tf/backend/us-east-2/prod/terraform.tfstate"
  #   region         = "us-east-2"
  #   dynamodb_table = "REPLACE_WITH_CREATED_TABLE"
  # }
}

provider "aws" {
  region = var.region
}

module "remote_backend" {
  source      = "../../../../infra/remote-backend"
  project     = var.project
  environment = var.environment
  region      = var.region
}

output "backend_bucket_name" {
  value = module.remote_backend.backend_bucket_name
}

output "backend_dynamodb_table_name" {
  value = module.remote_backend.backend_dynamodb_table_name
}

output "backend_kms_key_arn" {
  value = module.remote_backend.backend_kms_key_arn
}
