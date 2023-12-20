########################
# 𝖴𝖲𝖤𝖲 𝖣𝖤𝖥𝖠𝖴𝖫𝖳 𝖵𝖯𝖢 !!!
########################
data "aws_vpc" default_vpc {
  tags = {
    Name = "default"
  }
}

# TODO
# Look up a data source named "latest_ubuntu"
#
# - Terraform docs — https://www.terraform.io/docs/providers/aws/d/ami
# - See https://letslearndevops.com/2018/08/23/terraform-get-latest-centos-ami/ for syntax
# - Go to https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#LaunchInstanceWizard:
#   - Click on "Community AMIs"
#   - Search for '099720109477' — This is Canonical's ID (Publisher of Ubuntu)
#   — Make sure the pattern to use in your 'filter' for 'name is looking for focal-20.04


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
