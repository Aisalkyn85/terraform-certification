Steps:

1) terraform init
2) terraform apply

3) Manually edit drift.txt and change value=100 to value=999

4) terraform plan

Terraform will detect drift and plan to restore desired state.