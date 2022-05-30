terraform {
  required_version = var.terraform_version
  /*
  backend "s3" {
    bucket         = var.backens_s3_bucket
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
}