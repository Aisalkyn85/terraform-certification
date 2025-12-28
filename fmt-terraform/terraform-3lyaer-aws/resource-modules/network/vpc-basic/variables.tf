variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "az" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "database_subnet_cidr" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
