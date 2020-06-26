/*
Input vars that are needed in this module
https://www.terraform.io/docs/configuration/variables.html
*/
variable "default_tags" {
  type = map(string)
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "product" {
  type = string
}

variable "datalake_bucket_name" {
  type = string
}