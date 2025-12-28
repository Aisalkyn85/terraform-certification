variable "project" {
  type        = string
  description = "Project name prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., prod)"
}

variable "region" {
  type        = string
  description = "AWS region"
}
