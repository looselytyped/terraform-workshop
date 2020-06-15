module dev {
  source = "../../modules"

  vpc_name = "terraform_dev"

  subnet_name = "main"
  subnet_zone = "us-east-1a"
  ec2_ami     = "ami-00464cdaf53314d9f"
  ec2_size    = "t2.micro"
  ec2_count   = 1

  tags = {
    Module = true
  }
}


