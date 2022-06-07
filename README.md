## terraform-aws-cicd
![aws-cicd-terraform](https://user-images.githubusercontent.com/44127516/171139214-d0326329-6f1c-454b-957d-3fd96637daf3.jpg)

### Deploy Infrastrcture

Step01

Initial deploy should done from local computer.
```
terraform init
terraform plan
terraform apply
```

Step02
```
1. Remove comments beween ## Un-comment to start Backend migration / ## End of Backend migration in main.tf.
2. Add AWS account ID to Provider block.
    s3 backend within Terraform block Variables are not allowed.
3. then do : 
    terraform init
```


### Destroy Infrastrcture
```
1. comment again previusly un-commented sections.
2. terraform init -migrate-state
3. terraform destroy
```


### Using to Deploy Infrastructure Via Code
Users can use codecommit repository to manage any was infrastructure deployment assemble via terraform by using this cicd pipeline.

Once you have a finalize terraform code, add below code snippets into the main.tf or provider.tf etc..

Change bucket, region, dynamodb_table as per the inputs use in given aws infrastructure.

This will store terraform state for the infra deployment.
```
terraform {
  required_version = ">=1.0.0"

  ## Un-comment to start Backend migration
  backend "s3" {
    bucket         = "aws-cicd-backend-test"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-infra-state"
    encrypt        = true
  }
  ## End of Backend migration
}


data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}


provider "aws" {
  #profile = var.profile
  region  = var.aws_region

  ## Un-comment to start Backend migration
  assume_role {
    role_arn     = "arn:aws:iam::${local.account_id}:role/TerraformAssumedIamRole"
    session_name = "terraform"
  }
  ## End of Backend migration
}
```
Then commit the changes into the codecommit repository.