terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

locals {
  endpoint = "http://floci:4566"
}


# provider "aws" {} # When using real AWS
provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"

  s3_use_path_style = true

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3       = local.endpoint
    dynamodb = local.endpoint
    lambda   = local.endpoint
    iam      = local.endpoint
    sts      = local.endpoint
  }
}
