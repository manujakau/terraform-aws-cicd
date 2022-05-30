output "codebuild_terraform_plan" {
  value = aws_codebuild_project.codebuild_project_terraform_plan.name
}

output "codebuild_terraform_apply" {
  value = aws_codebuild_project.codebuild_project_terraform_apply.name
}