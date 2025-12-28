output "instance_id" {
  value = aws_instance.app.id
}

output "environment" {
  value = terraform.workspace
}