# Providers and profiles

provider "aws" {
  profile = local.workspace["profile"]
  region  = local.workspace["region"]
  version = "~> 2.8"
}