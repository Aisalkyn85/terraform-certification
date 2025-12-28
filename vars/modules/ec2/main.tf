locals {
  # 1. upper() → normalize environment
  env_upper = upper(var.env)

  # 2. format() → consistent naming
  ec2_name = format("demo-ec2-%s", var.env)

  # 3. merge() → default + custom tags
  default_tags = {
    ManagedBy = "terraform"
    Env       = var.env
  }

  merged_tags = merge(local.default_tags, var.tags)

  # 4. lookup() → safe map access
  team_name = lookup(var.tags, "team", "unknown")

  # 5. toset() → remove duplicate SGs
  security_groups = toset(["sg-aaa", "sg-bbb", "sg-aaa"])

  # 6. length() → count unique SGs
  sg_count = length(local.security_groups)
}

resource "aws_instance" "demo" {
  ami           = "ami-0f5fcdfbd140e4ab7"
  instance_type = var.instance_type

  tags = local.merged_tags
}

