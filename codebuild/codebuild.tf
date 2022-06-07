# CodeBuild Terraform Plan
resource "aws_codebuild_project" "codebuild_project_terraform_plan" {
  name          = var.codebuild_terraform_plan_value
  description   = "Terraform codebuild project"
  build_timeout = "5"
  service_role  = var.codebuild_iam_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type     = "S3"
    location = var.log_bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_LARGE"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "TERRAFORM_VERSION"
      value = var.terraform_version
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${var.log_bucket_id}/${var.codebuild_terraform_plan_value}/build-log"
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec_terraform_plan.yaml"
  }

  tags = {
    Terraform = "true"
  }
}


# CodeBuild Terraform Apply
resource "aws_codebuild_project" "codebuild_project_terraform_apply" {
  name          = var.codebuild_terraform_apply_value
  description   = "Terraform codebuild project"
  build_timeout = "25"
  service_role  = var.codebuild_iam_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type     = "S3"
    location = var.log_bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_LARGE"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "TERRAFORM_VERSION"
      value = var.terraform_version
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${var.log_bucket_id}/${var.codebuild_terraform_apply_value}/build-log"
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec_terraform_apply.yaml"
  }

  tags = {
    Terraform = "true"
  }
}