resource "aws_instance" "exercise_0070" {
  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"

  tags = {
    Name      = "exercise_0070"
    Terraform = true
  }
}
