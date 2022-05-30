terraform {
  required_version = var.terraform_version
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

provider "aws" {
  profile = var.profile
  region  = var.aws_region
  /*
  assume_role {
    # Remember to update this account ID to yours
    role_arn     = "arn:aws:iam::357846022338:role/TerraformAssumedIamRole"
    session_name = "terraform"
  }
*/
}


module "backend" {
  source                              = "./backend"
  tfstate_bucket                      = var.backend_s3_bucket
  log_bucket                          = var.log_bucket
  dynamo_db_table_name                = var.dynamodb_table
  codebuild_iam_role_name             = "CodeBuildIamRole"
  codebuild_iam_role_policy_name      = "CodeBuildIamRolePolicy"
  terraform_codecommit_repo_arn       = module.codecommit.terraform_codecommit_repo_arn
  tf_codepipeline_artifact_bucket_arn = module.codepipeline.tf_codepipeline_artifact_bucket_arn
}