## terraform-aws-cicd


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