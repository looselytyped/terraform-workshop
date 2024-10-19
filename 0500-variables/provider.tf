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
