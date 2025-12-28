variable "ami_id" {
  description = "ami-0ecb62995f68bb549"
  type        = string
}

variable "instance_type_map" {
  description = "Instance type per environment"
  type        = map(string)
  default = {
    dev   = "t2.micro"
    stage = "t2.small"
    prod  = "t3.medium"
  }
}
