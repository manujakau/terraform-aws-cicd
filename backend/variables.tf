variable "aws_region" {}
variable "tfstate_bucket" {}
variable "dynamo_db_table" {}
variable "log_bucket" {}

variable "codebuild_iam_role" {}
variable "codebuild_iam_role_policy" {}

variable "codecommit_repo_dependency" {}
variable "terraform_codecommit_repo_arn" {}

variable "artifact_bucket_dependency" {}
variable "codepipeline_artifact_bucket_arn" {}