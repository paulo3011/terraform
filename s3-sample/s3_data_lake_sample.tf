resource "aws_s3_bucket" "datalake" {
  bucket = "moreira-datalake"
  region = "us-east-1"
  acl    = "private"
}

resource "aws_s3_bucket_object" "stage" {
  bucket = "${aws_s3_bucket.datalake.id}"
  acl    = "private"
  key    = "stage/"
  source = ""
}

resource "aws_s3_bucket_object" "stage-firehosestream" {
  bucket = "${aws_s3_bucket.datalake.id}"
  acl    = "private"
  key    = "stage/firehosestream/"
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