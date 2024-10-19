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
# Resource identifier - exercise_0050
#
# ami = Use the id of 'latest_ubuntu'
# instance type = t2.micro
#
# Be sure to tag it with:
# - "Name" to "exercise_0040"
# - "Terraform" to true
#
# Add a THIRD tag called `env` that uses the value of the `tier` variable, uppercased!
# See https://developer.hashicorp.com/terraform/language/functions/upper
resource "aws_instance" "exercise_0050" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name      = "${upper(var.tier)}-example"
    Terraform = true
    env       = var.tier
  }
}

# There is a TODO for you in the output.tf
