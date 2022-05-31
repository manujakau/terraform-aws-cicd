terraform {
  required_version = ">=1.0.0"

## Un-comment to start Backend migration
  # backend "s3" {
  #   bucket         = "aws-cicd-backend-test"
  #   key            = "terraform.tfstate"
  #   region         = "eu-north-1"
  #   dynamodb_table = "terraform-infra-state"
  #   encrypt        = true
  # }
## End of Backend migration
}


provider "aws" {
  profile = var.profile
  region  = var.aws_region

## Un-comment to start Backend migration
  # assume_role {
  #   role_arn     = "arn:aws:iam::<account_id-enter-manualy-here>:role/TerraformAssumedIamRole"
  #   session_name = "terraform"
  # }
## End of Backend migration
}


module "backend" {
  source                           = "./backend"
  aws_region                       = var.aws_region
  tfstate_bucket                   = var.backend_s3_bucket
  log_bucket                       = var.log_bucket
  dynamo_db_table                  = var.dynamodb_table
  codebuild_iam_role               = var.codebuild_iam_role
  codebuild_iam_role_policy        = var.codebuild_iam_role_policy
  codecommit_repo_dependency       = module.codecommit.codecommit_repo_dependency
  terraform_codecommit_repo_arn    = module.codecommit.codecommit_repo_arn
  artifact_bucket_dependency       = module.codepipeline.artifact_bucket_dependency
  codepipeline_artifact_bucket_arn = module.codepipeline.codepipeline_artifact_bucket_arn
}


module "codecommit" {
  source          = "./codecommit"
  repository_name = var.repository_name
}


module "codebuild" {
  source                          = "./codebuild"
  terraform_version               = var.terraform_version
  codebuild_terraform_plan_value  = var.codebuild_terraform_plan_value
  codebuild_terraform_apply_value = var.codebuild_terraform_apply_value
  log_bucket                      = module.backend.log_bucket
  log_bucket_id                   = module.backend.log_bucket_id
  codebuild_iam_role_arn          = module.backend.codebuild_iam_role_arn
}


module "codepipeline" {
  source                             = "./codepipeline"
  terraform_codepipeline             = var.terraform_codepipeline
  codepipeline_artifact_bucket       = var.codepipeline_artifact_bucket
  terraform_codepipeline_role        = var.terraform_codepipeline_role
  terraform_codepipeline_role_policy = var.terraform_codepipeline_role_policy
  terraform_codecommit_repository    = module.codecommit.codecommit_repo_name
  codebuild_terraform_plan_value     = module.codebuild.codebuild_terraform_plan
  codebuild_terraform_apply_value    = module.codebuild.codebuild_terraform_apply
}