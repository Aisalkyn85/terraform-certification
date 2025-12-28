provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "cert-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-1b"]
  public_subnets  = ["10.0.1.0/24"]
}