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
Remove comment sections in main.tf. In s3 backend Variables not allowed.
then do : 
    terraform init
```


### Destroy Infrastrcture
```
1. comment again previusly un-commented sections.
2. run : terraform init -migrate-state
```