terraform {
  required_version = ">=1.0.0"
  /*
  backend "s3" {
    bucket         = var.backend_s3_bucket
    key            = var.terraform_tfstate
    region         = var.aws_region
    dynamodb_table = var.dynamodb_table
    encrypt        = true
  }
*/
}

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}


provider "aws" {
  profile = var.profile
  region  = var.aws_region

  #   assume_role {
  #     role_arn     = "arn:aws:iam::${local.account_id}:role/TerraformAssumedIamRole"
  #     session_name = "terraform"
  #   }
}


module "backend" {
  source                        = "./backend"
  aws_region                    = var.aws_region
  tfstate_bucket                = var.backend_s3_bucket
  log_bucket                    = var.log_bucket
  dynamo_db_table               = var.dynamodb_table
  codebuild_iam_role            = var.codebuild_iam_role
  codebuild_iam_role_policy     = var.codebuild_iam_role_policy
  codecommit_repo_dependency    = module.codecommit.codecommit_repo_dependency
  terraform_codecommit_repo_arn = module.codecommit.codecommit_repo_arn
  #tf_codepipeline_artifact_bucket_arn = module.codepipeline.tf_codepipeline_artifact_bucket_arn
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