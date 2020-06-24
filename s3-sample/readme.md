# how to

1 - First create file for provider ("provider.tf")

```tf
# Configure the AWS Provider
provider "aws" {
  version = "~> 2.8"
  region  = "us-east-1"
  profile = "default"
}

```

2 - Run terraform init to initialize provider plugins
```shell
terraform init
```
3 - Create a file for s3 resources ("s3_data_lake_sample.tf")

```tf

```

You can check if the bucket name is available using aws cli before create it.

```shell
# check if exists - The operation returns a 200 OK if the bucket exists and you have permission to access it. Otherwise, the operation 
# might return responses such as 404 Not Found and 403 Forbidden .
aws s3api head-bucket --bucket bucketname
# check if its ok
aws s3api create-bucket --bucket mybucketteste --region us-east-1
# delete if created
aws s3api delete-bucket --bucket mybucketteste
```

4 - 