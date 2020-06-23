resource "aws_s3_bucket" "datalake" {
    bucket = "moreira3011_teste"
    region = "us-east-1"
    //https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
    acl = "private"    
}

data "aws_s3_bucket_object" "stage" {
    //bucket on will be create the key object
    bucket = "${aws_s3_bucket.datalake.id}"
    //path to object or folder
    key = "stage"
}