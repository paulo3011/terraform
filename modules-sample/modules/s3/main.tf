locals {
  # input vars can be use like this: var.varname
  # local vars can be use like this: local.varname
  default_name = join("-", compact(list(var.product, var.environment, var.project)))
  acl                  = "private"
  S3_tags = {
    Name         = upper(local.default_name)
    Descritption = "Data lake ${upper(var.environment)}",
    Function     = "DATA LAKE"
  }
}

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "datalake" {
  bucket = var.datalake_bucket_name
  region = "us-east-1"
  acl    = local.acl
  tags   = merge(var.default_tags, local.S3_tags)
 }

# temporary data
resource "aws_s3_bucket_object" "stage" {
  bucket = aws_s3_bucket.datalake.id
  acl    = local.acl
  key    = "stage/"
}

resource "aws_s3_bucket_object" "stage-stream" {
  bucket = aws_s3_bucket.datalake.id
  acl    = local.acl
  key    = "stage/stream/"
  source = ""
}

# raw data, data in pure state without transformations
resource "aws_s3_bucket_object" "raw" {
  bucket = aws_s3_bucket.datalake.id
  acl    = local.acl
  key    = "raw/"
  source = ""
}

# datawarehouse folder - only transformed data / business data
resource "aws_s3_bucket_object" "dw" {
  bucket = aws_s3_bucket.datalake.id
  acl    = local.acl
  key    = "dw/"
  source = ""
}
