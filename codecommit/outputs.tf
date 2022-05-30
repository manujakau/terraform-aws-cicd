output "codecommit_repo_arn" {
  value = aws_codecommit_repository.repository.arn
}

output "codecommit_repo_name" {
  value = aws_codecommit_repository.repository.repository_name
}