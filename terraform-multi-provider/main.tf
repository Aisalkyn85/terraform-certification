module "ec2_east" {
  source        = "./modules/ec2"
  instance_name = "east-instance"

  providers = {
    aws = aws.east
  }
}

module "ec2_west" {
  source        = "./modules/ec2"
  instance_name = "west-instance"

  providers = {
    aws = aws.west
  }
}

