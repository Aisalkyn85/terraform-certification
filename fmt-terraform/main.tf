resource "aws_instance" "demo" {
  ami           = "ami-1234234"
  instance_type = "t2.micro"
  tags          = { Name = "fmt-demo" }

}