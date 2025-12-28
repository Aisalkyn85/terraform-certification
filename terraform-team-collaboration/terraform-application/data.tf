data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "terraform-state-company-prod"
    key    = "networking/terraform.tfstate"
    region = "us-east-1"
  }
}
