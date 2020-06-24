resource "aws_s3_bucket" "datalake" {
  bucket = "moreira-datalake"
  region = "us-east-1"
  acl    = "private"

  lifecycle_rule {
    id      = "storage_class_policy"
    enabled = true

    tags = {
      "rule" = "storage_class_policy"
      "prefix" = "empty"
    }

    transition {
      days          = 30 # 'Days' in Transition action must be greater than or equal to 30 for storageClass 'ONEZONE_IA or STANDARD_IA'
      storage_class = "ONEZONE_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER" # (Required) Specifies the Amazon S3 storage class to which you want the noncurrent object versions to transition. Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE.
    }

    expiration {
      days = 90 # will be deleted, its just a test
    }
  }  
}

resource "aws_s3_bucket_object" "stage" {
  bucket = "${aws_s3_bucket.datalake.id}"
  acl    = "private"
  key    = "stage/"
  source = ""
}

resource "aws_s3_bucket_object" "stage-stream" {
  bucket = "${aws_s3_bucket.datalake.id}"
  acl    = "private"
  key    = "stage/stream/"
  source = ""
}

resource "aws_s3_bucket_object" "raw" {
  bucket = "${aws_s3_bucket.datalake.id}"
  acl    = "private"
  key    = "raw/"
  source = ""
}

resource "aws_s3_bucket_object" "dw" {
  bucket = "${aws_s3_bucket.datalake.id}"
  acl    = "private"
  key    = "datawarehouse/"
  source = ""
}