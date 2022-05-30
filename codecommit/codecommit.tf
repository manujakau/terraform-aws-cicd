resource "aws_codecommit_repository" "repository" {
  repository_name = var.repository_name
  description     = "CodeCommit Terraform repo for test"
}