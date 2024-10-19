# TODO
# Look up a data source named "latest_ubuntu"
#
# - Terraform docs — https://www.terraform.io/docs/providers/aws/d/ami.html
# - See https://letslearndevops.com/2018/08/23/terraform-get-latest-centos-ami/ for syntax
#
# You will have two filters
# - For the "name" filter, search for "amzn-ami-2018.03.*-amazon-ecs-optimized"
# - For the "virtualization-type" filter search for "hvm"
data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["591542846629"] # Canonical

  filter {
    name   = "name"
    values = ["amzn-ami-2018.03.*-amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# TODO
# Define an EC2 instance (aws_instance) with the following constraints:
# Resource identifier - exercise_0040
#
# ami = Use the id of the Ubuntu AMI you looked up
# instance type = t2.micro
#
# Be sure to tag it with:
# - "Name" to "exercise_0040"
# - "Terraform" to true
resource "aws_instance" "exercise_0040" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name      = "exercise_0040"
    Terraform = true
  }
}

# There is a TODO for you in the output.tf
