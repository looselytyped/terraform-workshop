terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }

  # ——— UNCOMMENT AFTER FIRST APPLY ———————————————————————————————————————————
  # backend "s3" {
  #   # this is simply for localstack to work correctly
  #   endpoint = "http://s3.localhost.localstack.cloud:4566"

  #   # this is the real code you'll need
  #   bucket = "looselytyped.terraforming-workshop-backend"
  #   # note how I put the "env" name here
  #   key    = "looselytyped/dev/terraform.tfstate"
  #   region = "us-east-1"

  #   dynamodb_table = "terraforming-your-cloud-state-demo"
  #   encrypt        = true
  # }
}
