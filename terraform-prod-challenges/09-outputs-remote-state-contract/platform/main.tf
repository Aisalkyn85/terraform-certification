terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "platform" {
  filename = "${path.module}/platform.txt"
  content  = "subnet_id=subnet-123\n"
}
