# How to

1 - First download the terraform binary and place it in the path directory

2 - After, configure setting like aws profile and others configuration on environments json files

3 - Run terraform init to initialize provider plugins

```shell
terraform init
```
4 - Create workspace to control variables by environment (dev, hom, prod)

```shell
terraform workspace new dev
terraform workspace new hom
terraform workspace new prod
terraform workspace list
terraform workspace select dev
```

5 - Run fmt command to format .tf files

```shell
terraform fmt
```

6 - Run validate command to check if .tf files is ok

```shell
terraform validate
```

7 - Run plan command to preview changes before execute apply

```shell
terraform plan
```

8 - Execute apply command

```shell
terraform apply
```

9 - Answer yes to apply changes

10 - To test different environment you can change variables parameters at vars.tf or on environments json files. Than change to another workspace and execute plan to view changes that will be applyed

```shell
terraform workspace select hom
terraform plan
```

11 - You can execute destroy to destroy all resources and start again

```shell
# be carefull to not destroy production resources
terraform workspace select test
terraform destroy
```

# Tips

1- You can check if the bucket name is available using aws cli before create it.

```shell
# check if exists - The operation returns a 200 OK if the bucket exists and you have permission to access it. Otherwise, the operation
# might return responses such as 404 Not Found and 403 Forbidden .
aws s3api head-bucket --bucket moreira-datalake
# check if its ok
aws s3api create-bucket --bucket moreira-datalake --region us-east-1
# delete if created
aws s3api delete-bucket --bucket moreira-datalake
```