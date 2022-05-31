## terraform-aws-cicd

Initial deploy should done from local computer.

```
Remove comment sections in main.tf. In s3 backend Variables not allowed.
then do : terraform init
```


### Destroy Infrastrcture
```
1. comment again previusly un-commented sections.
2. run : terraform init -migrate-state
```