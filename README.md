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
Remove comments beween ## Un-comment to start Backend migration / ## End of Backend migration in main.tf. 
s3 backend within Terraform block Variables are not allowed.
then do : 
    terraform init
```


### Destroy Infrastrcture
```
1. comment again previusly un-commented sections.
2. run : terraform init -migrate-state
```