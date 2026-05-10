terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }

  backend "s3" {
    bucket  = "tf-state-bucket"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true

    # AWS Emulator config
    endpoints = {
      s3 = "http://floci:4566"
    }

    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true

    access_key = "test"
    secret_key = "test"

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


  # AWS Emulator config
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

# Must be created with backend commented
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [ 
    aws_s3_bucket.terraform_state
   ]
}