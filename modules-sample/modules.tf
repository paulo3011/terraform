locals {
  # here, on environment.json on that exists  __VarName__ -> replace tokens on Azure
  workspace = jsondecode(file("./environments/${terraform.workspace}.json"))

  default_tags = {
    Company = upper(local.workspace["company"])
    Product = upper(local.workspace["product"])
    Project = upper(local.workspace["project"])
    Stack   = upper(local.workspace["environment"])
  }
}

# https://www.terraform.io/docs/configuration/modules.html

module "s3" {
  # SOURCE CODE FOR S3 MODULE
  source = "./modules/s3"
  # INPUT VARS
  environment          = local.workspace["environment"]
  product              = local.workspace["product"]
  project              = local.workspace["project"]
  default_tags         = local.default_tags
  datalake_bucket_name = local.workspace["datalake_bucket_name"]
}


# Configure backend on s3

/*
terraform {
  backend "s3" {
  profile = "yourprofile"
  bucket = "yourbucket-for-terraform-state"
  key = "states"
  region = "sa-east-1"
  }
}
*/