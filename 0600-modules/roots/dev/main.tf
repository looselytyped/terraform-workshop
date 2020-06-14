resource "aws_vpc" "terraform_dev" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "terraform_dev"
    Terraform   = true
    Environment = "dev"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.terraform_dev.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name      = "main"
    Terraform = true
  }
}

resource "aws_instance" "exercise_0060" {
  ami           = "ami-00464cdaf53314d9f"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  count         = 1

  tags = {
    Name      = "exercise_0060.${count.index}"
    Terraform = true
  }
}

