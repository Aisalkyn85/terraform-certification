provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "demo" {
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = "t2.micro"

    tags = {
        Name = local.instance_name 
        Env = var.env # dev
    }
}