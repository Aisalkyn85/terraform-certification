data "terraform_remote_state" "infra" {
  backend = "s3"

  config = {
    bucket = "tf-state-aj"
    key    = "infra/s3.tfstate"
    region = "us-west-1"
  }
}

output "bucket_from_infra" {
  value = data.terraform_remote_state.infra.outputs.bucket_name
}
