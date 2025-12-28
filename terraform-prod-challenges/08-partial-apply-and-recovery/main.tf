terraform {
  required_version = ">= 1.5.0"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

resource "null_resource" "step1" {}

resource "null_resource" "step2_fail" {
  provisioner "local-exec" {
    command = "echo 'simulating failure' && exit 1"
  }
}
