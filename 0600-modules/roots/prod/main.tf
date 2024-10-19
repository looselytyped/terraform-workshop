module "dev" {
  source = "../../modules"

  vpc_name = "terraform_prod"

  subnet_name = "main"
  subnet_zone = "us-east-1e"
  ec2_ami     = "ami-edbfe74c41f8"
  ec2_size    = "t2.small"
  ec2_count   = 2

  tags = {
    Module = true
  }
}

