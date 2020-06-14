provider "aws" {
  access_key = "YOUR_AWS_KEY_ID_HERE"
  secret_key = "YOUR_SECRET_ACCESS_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "my_terraform_state" {
  bucket = "looselytyped.terraforming-workshop-backend"

  # # Prevent accidental deletion of this S3 bucket
  # # If you decide to destroy this be sure to destroy my_terraform_locks as well
  # lifecycle {
  #   prevent_destroy = true
  # }

  force_destroy = true

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "my_terraform_locks" {
  name         = "terraforming-your-cloud-state-demo"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  # Prevent accidental deletion of this table
  # If you decide to destroy this be sure to destroy my_terraform_state as well
  # lifecycle {
  #   prevent_destroy = true
  # }

  attribute {
    name = "LockID"
    type = "S"
  }
}
