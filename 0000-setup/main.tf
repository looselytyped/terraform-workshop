provider "aws" {
  access_key = "INSERT_AWS_KEY"
  secret_key = "INSERT_AWS_SECRET"
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
