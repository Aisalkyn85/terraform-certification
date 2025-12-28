provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "demo" {
  ami           = "ami-167890abcdef0" # ❌ INVALID AMI
  instance_type = "t2.micro"

  tags = {
    Name = "debug-lab"
  }
}

