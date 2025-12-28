terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "names" {
  type    = list(string)
  default = ["orders", "payments"]
}


resource "local_file" "svc" {
  for_each = toset(var.names)
  filename = "${path.module}/${each.value}.txt"
  content  = "service=${each.value}\n"
}