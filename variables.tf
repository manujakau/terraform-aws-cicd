variable "terraform_version" {}
variable "backend_s3_bucket" {}
variable "terraform_tfstate" {}
variable "dynamodb_table" {}

variable "profile" {}
variable "aws_region" {}


variable "log_bucket" {}
variable "codebuild_iam_role" {}
variable "codebuild_iam_role_policy" {}

variable "repository_name" {}

variable "codebuild_terraform_plan_value" {}
variable "codebuild_terraform_apply_value" {}

variable "terraform_codepipeline" {}
variable "codepipeline_artifact_bucket" {}

variable "terraform_codepipeline_role" {}
variable "terraform_codepipeline_role_policy" {}