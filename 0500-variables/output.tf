output ami {
  value = data.aws_ami.latest_ubuntu.id
}

output ec2_instance_public_ip {
  value = aws_instance.exercise_0050.public_ip
}
