terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.68.0"
    }
  }

  # backend "s3" {
  #   bucket = "looselytyped.terraforming-workshop-backend"
  #   key    = "looselytyped/dev/terraform.tfstate"
  #   region = "us-east-1"

  #   dynamodb_table = "terraforming-your-cloud-state-demo"
  #   encrypt        = true
  # }
}
