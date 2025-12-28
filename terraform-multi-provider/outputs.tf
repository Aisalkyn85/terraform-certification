output "east_instance_id" {
  value = module.ec2_east.instance_id
}

output "west_instance_id" {
  value = module.ec2_west.instance_id
}
