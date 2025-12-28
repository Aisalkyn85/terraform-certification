module "ec2" {
  source        = "./modules/ec2"
  env           = var.env
  instance_type = var.instance_type
  tags          = var.tags
}

