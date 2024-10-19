locals {
  module_tags = merge(
    {
      Terraform = true,
    },
    var.tags,
  )
}

resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = merge(
    {
      Name = var.vpc_name
    },
    local.module_tags,
  )
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.subnet_zone

  tags = merge(
    {
      Name = var.subnet_name
    },
    local.module_tags,
  )
}

resource "aws_instance" "exercise_0060" {
  ami           = var.ec2_ami
  instance_type = var.ec2_size
  subnet_id     = aws_subnet.main.id
  count         = var.ec2_count

  tags = merge(
    {
      Name = "exercise_0060.${count.index}",
    },
    local.module_tags,
  )
}
