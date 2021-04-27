terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "exercise_0000" {
  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"

  tags = {
    Name      = "exercise_0000"
    Terraform = true
  }
}
