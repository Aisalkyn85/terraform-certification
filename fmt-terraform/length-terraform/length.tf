provider "aws" {
    region = "us-east-2"
}
resource "aws_security_group" "web" {
    name = "webs-sg"
    description = "Allow HTTP"
    vpc_id = "vpc-09beae8b49db20e76"
}

resource "aws_security_group" "ssh" {
    name = "ssh-sg"
    description = "Allow SSH"
    vpc_id = "vpc-09beae8b49db20e76"
}

locals {
    sg_list = [
        aws_security_group.web.id,
        aws_security_group.ssh.id
    ]

    sg_count = length(local.sg_list)
}

resource "aws_instance" "demo" {
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = "t2.micro"

    vpc_security_group_ids = local.sg_list

    tags = {
        Name = "Alfiya"
        sg_count = local.sg_count
    }
}