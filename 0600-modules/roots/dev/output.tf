output vpc_id {
  value = aws_vpc.terraform_dev.id
}

output subnet_id {
  value = aws_subnet.main.id
}

output ec2_instance_private_ip {
  value = aws_instance.exercise_0060.*.private_ip
}

