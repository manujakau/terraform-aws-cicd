variable "terraform_codepipeline" {}
variable "codepipeline_artifact_bucket" {}

variable "terraform_codepipeline_role" {}
variable "terraform_codepipeline_role_policy" {}

variable "terraform_codecommit_repository" {}
variable "codebuild_terraform_plan_value" {}
variable "codebuild_terraform_apply_value" {}