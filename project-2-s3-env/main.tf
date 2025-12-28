provider "aws" {
  region = "us-west-1"
}

locals {
  environments = {
    dev  = "dev-app-bucket-aisalkyn"
    prod = "prod-app-bucket-aisalkyn"
  }
}

module "s3" {
  source = "./modules/s3-bucket"
  for_each = local.environments

  bucket_name = each.value
}

output "bucket_names" {
  value = {
    for env, mod in module.s3 :
    env => mod.bucket_name
  }
}