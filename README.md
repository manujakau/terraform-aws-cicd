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