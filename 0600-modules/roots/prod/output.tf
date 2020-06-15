output vpc_id {
  value = module.dev.vpc_id
}

output subnet_id {
  value = module.dev.subnet_id
}

output ec2_instance_private_ip {
  value = module.dev.ec2_instance_private_ip
}
