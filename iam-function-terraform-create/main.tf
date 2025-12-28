provider "aws" {
    region = "us-east-2"
}
resource "aws_iam_user" "demo" {
    name = "terraform-function-demo-user"
}
resource "aws_iam_user_policy" "demo_policy" {
    name = "demo-policy"
    user = aws_iam_user.demo.name

policy = file("${path.module}/iam-policy.json")

}
