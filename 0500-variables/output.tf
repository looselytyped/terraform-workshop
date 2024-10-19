# TODO
# Use the output block to display all the tags of the exercise_0050 ec2 resource
output "ec2_instance_tags" {
  value = aws_instance.exercise_0050.tags
}
