terraform {
  backend "s3" {
    bucket = "tf-state-aj"
    key    = "infra/s3.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "shared" {
  bucket = "shared-logs-aj"
}

output "bucket_name" {
  value = aws_s3_bucket.shared.bucket
}
