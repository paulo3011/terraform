# how to

1 - First create file for provider ("provider.tf")
2 - Run terraform init to initialize provider plugins
```shell
terraform init
```
3 - Create a file for s3 resources ("s3_data_lake_sample.tf")

```tf

```

You can check if the bucket name is available using aws cli before create it.

```shell
# check if exists
aws s3api head-bucket --bucket bucketname
# check if its ok
aws s3api create-bucket --bucket bucketname
# delete if created
```

4 - 