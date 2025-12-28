terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "drift_demo" {
  filename = "${path.module}/drift.txt"
  content  = "managed_by=terraform\nvalue=100\n"
}