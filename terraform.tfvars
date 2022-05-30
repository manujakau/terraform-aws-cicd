terraform_version = "1.2.1"
backend_s3_bucket = "aws-cicd-backend-test"
terraform_tfstate = "terraform.tfstate"
dynamodb_table    = "terraform-infra-state"

profile    = "default"
aws_region = "eu-north-1"

log_bucket                = "aws-cicd-backend-test-logs"
codebuild_iam_role        = "CodeBuildIamRole"
codebuild_iam_role_policy = "CodeBuildIamRolePolicy"

repository_name = "aws-cicd-test"

codebuild_terraform_plan_value  = "TerraformPlan"
codebuild_terraform_apply_value = "TerraformApply"

terraform_codepipeline             = "TerraformCodePipeline"
codepipeline_artifact_bucket       = "aws-cicd-artifact-test"
terraform_codepipeline_role        = "TerraformCodePipelineIamRole"
terraform_codepipeline_role_policy = "TerraformCodePipelineIamRolePolicy"