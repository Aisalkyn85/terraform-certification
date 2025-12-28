resource "aws_instance" "app" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"

  subnet_id = data.terraform_remote_state.network.outputs.subnet_id

  tags = {
    Name = "app-server"
  }
}
