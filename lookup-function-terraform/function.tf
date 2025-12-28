resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0f5fcdfbd140e4ab7"
  instance_type = "t2.micro"

  tags = {
    Name = "web-${count.index}"
  }
}

