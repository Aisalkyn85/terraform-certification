provider "aws" {
    region = "us-east-2"
}

resource "aws_security_group" "sg" {
    name = "sg"
    description = "Allow SSH"

    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "web" {
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = "t2.micro"

    vpc_security_group_ids = [
        aws_security_group.sg.id
    ]

    tags = {
        Name = "cross-ref-demo"
    }
}