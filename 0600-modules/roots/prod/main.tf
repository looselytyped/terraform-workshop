module dev {
  source = "../../modules"

  vpc_name = "terraform_prod"

  subnet_name = "main"
  subnet_zone = "us-east-1e"
  ec2_ami     = "ami-085925f297f89fce1"
  ec2_size    = "t2.small"
  ec2_count   = 2

  tags = {
    Module = true
  }
}

