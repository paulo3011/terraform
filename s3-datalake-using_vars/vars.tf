variable "product" {
  default = "BIGDATA-DATALAKE"
}

# s3 variables
variable "storage_glacier_days" {
  # 'Days' in the 'Transition' action for StorageClass 'GLACIER' must be greater than 'Days' for StorageClass 'ONEZONE_IA' or STANDARD_IA
  default = {
    dev  = 60
    prod = 365
  }
}