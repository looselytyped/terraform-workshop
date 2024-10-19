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

# TODO
# Define an EC2 instance (aws_instance) with the following constraints:
# Resource identifier - exercise_0010
#
# ami = ami-edbfe74c41f8
# instance type = t2.micro
#
# Be sure to tag it with:
# - "Name" to "exercise_0010"
# - "Terraform" to true
resource "aws_instance" "exercise_0010" {
  ami           = "ami-edbfe74c41f8"
  instance_type = "t2.micro"

  tags = {
    Name      = "exercise_0010"
    Terraform = true
  }
}
