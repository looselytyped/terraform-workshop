resource "aws_vpc" "terraform_prod" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "terraform_prod"
    Terraform   = true
    Environment = "prod"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.terraform_prod.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1e"

  tags = {
    Name      = "main"
    Terraform = true
  }
}

resource "aws_instance" "exercise_0060" {
  ami           = "ami-085925f297f89fce1"
  instance_type = "t2.small"
  subnet_id     = aws_subnet.main.id
  count         = 2

  tags = {
    Name      = "exercise_0060.${count.index}"
    Terraform = true
  }
}

