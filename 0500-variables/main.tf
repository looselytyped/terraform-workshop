data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
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
# Add a THIRD tag called `env` that uses the value of the `tier` variable
resource "aws_instance" "exercise_0050" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name      = "${upper(var.tier)}-example"
    Terraform = true
    env       = var.tier
  }
}
