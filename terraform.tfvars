terraform_version = ">=1.0.0"
backend_s3_bucket = "aws-cicd-backend-test"
terraform_tfstate = "terraform.tfstate"
dynamodb_table    = "terraform-infra-state"

profile    = "default"
aws_region = "eu-north-1"

log_bucket = "aws-cicd-backend-test-logs"