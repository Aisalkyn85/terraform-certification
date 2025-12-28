resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

locals {
  bucket_name = "${var.project}-${var.environment}-tfstate-${random_integer.suffix.result}"
  table_name  = "${var.project}-${var.environment}-tf-lock"
}

module "kms_backend" {
  source      = "../../resource-modules/security/kms-backend"
  description = "KMS key for Terraform state encryption"
}

module "s3_backend" {
  source        = "../../resource-modules/storage/s3-backend"
  bucket_name   = local.bucket_name
  force_destroy = false
  kms_key_arn   = module.kms_backend.key_arn
}

module "dynamodb_backend" {
  source     = "../../resource-modules/database/dynamodb-backend"
  table_name = local.table_name
}

