

terraform {
    backend "s3" {
        bucket = "my-terraform-state-bucket-aj"
        key = "prod/ec2/terraform.tfstate"
        region = "us-east-2"

        dynamodb_table = "terraform-locks-aj"
        encrypt = true
    }
}

provider "aws" {
    region = "us-east-2"
}
resource "aws_instance" "lock_demo" {
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = "t2.micro"

provisioner "local-exec" {
    command = "sleep 60"
}
tags = {
    Name = "terraform-state"
}
}