terraform {
  required_version = ">= 1.5.0"

  backend "local" {
    path = "state-v2/terraform.tfstate"
  }
}

resource "terraform_data" "backend_note" {
  input = "backend demo v1"
}

