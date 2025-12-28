provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "latest_ubuntu" {
  most_recent = true


  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "latest_ubuntu-demo"
  }

}