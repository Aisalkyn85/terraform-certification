provider "aws" {
    region = "us-west-1"
}

data "aws_vpc" "default" {
    default = true
}

resource "aws_security_group" "ssh_http" {
    name = "ssh-http-sg"
    vpc_id = data.aws_vpc.default.id

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "remote_demo" {
    ami = "ami-0e6a50b0059fd2cc3"
    instance_type = "t2.micro"
    key_name = "california"
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.ssh_http.id]


    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("/Users/aisalkyn/Downloads/california.pem")
        host = self.public_ip

        timeout = "10m"
    }
    provisioner "remote-exec" {
        inline = [
            
            "sudo apt update -y",
            "sudo apt install -y nginx",
            "sudo systemctl enable nginx",
            "sudo systemctl start nginx"

            
        ]
    }
    tags = {
        Name = "remote-exec-demo"
    }
}