terraform {
  required_version = ">= 1.5.0"
}

data "terraform_remote_state" "platform" {
  backend = "local"
  config = {
    path = "../platform/terraform.tfstate"
  }
}

resource "terraform_data" "use_contract" {
  input = {
    subnet = data.terraform_remote_state.platform.outputs.subnet_id
  }
}
