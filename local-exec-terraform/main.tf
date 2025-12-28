provider "aws" {
    region = "us-west-1"
}
resource "aws_instance" "demo" {
    ami = "ami-0e6a50b0059fd2cc3"
    instance_type = "t2.micro"

    provisioner "local-exec" {
        command = "echo ${self.public_ip} > ec2_ip.txt"
    }
    tags = {
        Name = "local-exec-demo"
    }

}