variable "env" {
    description = "Environment name: dev or prod"
    type = string
}

variable "region" {
    type = string
}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "instance_name" {
    type = string
}
