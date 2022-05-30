resource "aws_codepipeline" "terraform_codepipeline" {
  name     = var.terraform_codepipeline
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_artifact_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        RepositoryName = var.terraform_codecommit_repository
        BranchName     = "master"
      }
    }
  }

  stage {
    name = "Terraform_Plan"

    action {
      name             = "Terraform-Plan"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      version          = "1"

      configuration = {
        ProjectName = var.codebuild_terraform_plan_value
      }
    }
  }

stage {
  name = "Manual_Approval"

  action {
    name     = "Manual-Approval"
    category = "Approval"
    owner    = "AWS"
    provider = "Manual"
    version  = "1"
  }
}

  stage {
    name = "Terraform_Apply"

    action {
      name            = "Terraform-Apply"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["SourceArtifact"]
      version         = "1"

      configuration = {
        ProjectName = var.codebuild_terraform_apply_value
      }
    }
  }
}