variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

variable "AWS_DEFAULT_REGION" {
  type = string
  default = "us-east-1"
}

# TODO
# define a new variable called 'tier' of type 'string' to specify the env
# and use that in your EC2 instance.
#  Default it to 'dev'
variable tier {
  type = string
  default = "dev"
}
