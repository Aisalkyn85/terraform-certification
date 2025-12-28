terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "new_name" {
  filename = "${path.module}/name.txt"
  content  = "hello\n"
}
