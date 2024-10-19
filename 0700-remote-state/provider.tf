provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"
  profile    = "localstack"

  endpoints {
    ec2 = "http://localhost:4566"
    # s3  = "http://s3.localhost.localstack.cloud:4566"
    s3              = "http://localhost:4566"
    dynamodb        = "http://localhost:4566"
    route53         = "http://localhost:4566"
    route53resolver = "http://localhost:4566"

    iam = "http://localhost:4566"
    sts = "http://localhost:4566"
  }

  s3_use_path_style = true
}


resource "aws_s3_bucket" "my_terraform_state" {
  bucket = "looselytyped.terraforming-workshop-backend"

  # Prevent accidental deletion of this S3 bucket
  # If you decide to destroy this be sure to destroy
  # aws_dynamodb_table.my_terraform_locks as well
  lifecycle {
    prevent_destroy = true
  }

  force_destroy = true
}

# Enable versioning so we can see the full revision history of our state files
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.my_terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.my_terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "my_terraform_locks" {
  name         = "terraforming-your-cloud-state-demo"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  # Prevent accidental deletion of this table
  # If you decide to destroy this be sure to destroy
  # aws_s3_bucket.my_terraform_state as well
  # lifecycle {
  #   prevent_destroy = true
  # }

  attribute {
    name = "LockID"
    type = "S"
  }
}
