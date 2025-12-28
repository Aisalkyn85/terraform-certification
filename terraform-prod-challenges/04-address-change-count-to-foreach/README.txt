Steps:

1) terraform init
2) terraform apply

3) Edit main.tf to FOREACH version:

resource "local_file" "svc" {
  for_each = toset(var.names)
  filename = "${path.module}/${each.value}.txt"
  content  = "service=${each.value}\n"
}

4) terraform plan (will show recreate)

Fix with state mv:
terraform state mv 'local_file.svc[0]' 'local_file.svc["orders"]'
terraform state mv 'local_file.svc[1]' 'local_file.svc["payments"]'

Then:
terraform plan
terraform apply
