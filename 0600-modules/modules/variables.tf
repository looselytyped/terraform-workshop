variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable vpc_name {
  type = string
}

variable subnet_name {
  type    = string
  default = "main"
}

variable subnet_zone {
  type    = string
  default = "us-east-1a"
}

variable ec2_ami {
  type    = string
  default = "ami-00464cdaf53314d9f"
}

variable ec2_size {
  type    = string
  default = "t2.micro"
}

variable ec2_count {
  type    = number
  default = 1
}
