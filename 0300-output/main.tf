########################
# 𝖴𝖲𝖤𝖲 𝖣𝖤𝖥𝖠𝖴𝖫𝖳 𝖵𝖯𝖢 !!!
########################
resource "aws_security_group" "sec_ssh" {
  # you can have as many ingress/egress blocks as you want
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "sec_ssh"
    Terraform = true
  }
}

# Demo
output sec_ssh {
  value = aws_security_group.sec_ssh.arn
}

resource "aws_instance" "exercise_0030" {
  ami           = "ami-085925f297f89fce1"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.sec_ssh.id,
  ]

  tags = {
    Name      = "exercise_0030"
    Terraform = true
  }
}

# TODO
# Output the public IP address of the exercise_0030 instance.
# Read the docs at https://www.terraform.io/docs/providers/aws/r/instance.html#attributes-reference
# to see what attribute you are going to use to look up
output instance_public_ip {
  value = aws_instance.exercise_0030.public_ip
}
