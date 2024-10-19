terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"
  profile    = "localstack"

  endpoints {
    ec2             = "http://localhost:4566"
    s3              = "http://s3.localhost.localstack.cloud:4566"
    dynamodb        = "http://localhost:4566"
    route53         = "http://localhost:4566"
    route53resolver = "http://localhost:4566"
  }
}

resource "aws_instance" "exercise_0000" {
  ami           = "ami-edbfe74c41f8"
  instance_type = "t2.micro"

  tags = {
    Name      = "exercise_0000"
    Terraform = true
  }
}
