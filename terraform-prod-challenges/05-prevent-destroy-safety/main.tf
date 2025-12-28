terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "critical" {
  filename = "${path.module}/critical.txt"
  content  = "do_not_delete\n"

  lifecycle {
    prevent_destroy = true
  }
}
