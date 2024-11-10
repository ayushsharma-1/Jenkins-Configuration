terraform {
  required_version = ">= 1.9.5"
}

# Configure the AWS provider
provider "aws" {}

# Get the AWS account ID to generate unique S3 bucket name
data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

# Create the S3 bucket for Terraform state storage
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${local.account_id}-terraform-states"

  # Enable versioning on the S3 bucket to track changes in state files
  versioning {
    enabled = true
    mfa_delete = false  # Optional: Set to true to require MFA to delete state versions
  }

  # Enable server-side encryption for secure storage
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable logging to capture access to the bucket (optional)
  logging {
    target_bucket = "log-bucket"  # Specify a separate S3 bucket for logging
    target_prefix = "logs/"
  }
}

# Create the DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
