# how to

Example for creating datalake buckets with subfolders

1 - First Configure the AWS Provider ("provider.tf")

```tf
provider "aws" {
  version = "~> 2.8"
  region  = "us-east-1"
  profile = "put your aws profile name here"
}
```

2 - Run terraform init to initialize provider plugins

```shell
terraform init
```
3 - Set bucket name ("s3_datalake.tf")

```tf
resource "aws_s3_bucket" "datalake" {
  bucket = "set an unique name here"
  region = "us-east-1"
  acl    = "private"
}
```

You can check if the bucket name is available using aws cli before create it.

```shell
# check if exists - The operation returns a 200 OK if the bucket exists and you have permission to access it. Otherwise, the operation 
# might return responses such as 404 Not Found and 403 Forbidden .
aws s3api head-bucket --bucket moreira-datalake
# check if its ok
aws s3api create-bucket --bucket moreira-datalake --region us-east-1
# delete if created
aws s3api delete-bucket --bucket moreira-datalake
```

4 - Run validate command to check if .tf files is ok

```shell
terraform validate
```

5 - Run plan command to preview changes before execute apply

```shell
terraform plan
```

6 - Execute apply command

```shell
terraform apply
```

7 - Answer yes to apply changes