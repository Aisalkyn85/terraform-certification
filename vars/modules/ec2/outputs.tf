output "ec2_id" {
  value = aws_instance.demo.id
}

output "ec2_name" {
  value = local.ec2_name
}

output "sg_count" {
  value = local.sg_count
}

