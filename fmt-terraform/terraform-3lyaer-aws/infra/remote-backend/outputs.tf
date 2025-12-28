output "backend_bucket_name" {
  value = module.s3_backend.bucket_name
}

output "backend_dynamodb_table_name" {
  value = module.dynamodb_backend.table_name
}

output "backend_kms_key_arn" {
  value = module.kms_backend.key_arn
}
