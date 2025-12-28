locals {
  env = terraform.workspace

  instance_type = lookup(
    var.instance_type_map,
    local.env,
    "t2.micro"
  )
}
