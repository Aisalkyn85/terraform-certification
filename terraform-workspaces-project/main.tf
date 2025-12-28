resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = local.instance_type

  tags = {
    Name        = "app-${terraform.workspace}"
    Environment = terraform.workspace
  }
}
