resource "aws_s3_bucket" "datalake" {
  bucket = "m3011"
  region = "us-east-1"
  acl    = "private"
}

resource "aws_s3_bucket_object" "folder1" {
  bucket = "${aws_s3_bucket.datalake.id}"
  acl    = "private"
  key    = "Folder1/"
  source = ""
}