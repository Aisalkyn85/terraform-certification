Steps:

1) Run platform:
cd platform
terraform init
terraform apply

2) Run app:
cd ../app
terraform init
terraform apply

Break contract:
Rename output subnet_id -> public_subnet_id in platform outputs.tf
Apply platform again

App will fail until it is updated.

Lesson:
Outputs are API contracts between teams.
