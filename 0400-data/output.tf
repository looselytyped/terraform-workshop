output vpc_id {
  value = data.aws_vpc.default_vpc.id
}

# TODO
# Output the ID of 'latest_ubuntu' that you "looked up" using the data
# Read the docs at https://www.terraform.io/docs/providers/aws/r/instance.html#attributes-reference
# to see what attribute you are going use for printing out the ID
output ami {
  value = data.aws_ami.latest_ubuntu.id
}
