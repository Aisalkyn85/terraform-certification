provider "aws" {
    region = "us-east-2"
}
resource "aws_instance" "awsdemo" {
    ami = "ami-123412342154"
    instance_type = "t2.micro"

    tags = {
        Name = var.instance_name
    }
}
