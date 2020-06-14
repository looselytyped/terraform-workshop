provider "aws" {
  access_key = "<INSERT_YOUR_AWS_ACCESS_KEY_HERE>"
  secret_key = "<INSERT_YOUR_AWS_SECRET_KEY_HERE>"
  region     = "us-east-1"
}

# TODO
# Define an EC2 instance (aws_instance) with the following constraints:
# Resource identifier - exercise_0010
#
# ami = ami-07ebfd5b3428b6f4d
# instance type = t2.micro
#
# Be sure to tag it with:
# - "Name" to "exercise_0010"
# - "Terraform" to true
resource "aws_instance" "exercise_0010" {
  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"

  tags = {
    Name      = "exercise_0010"
    Terraform = true
  }
}
