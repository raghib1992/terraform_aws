variable "AWS_REGION" {}

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AMIS" {
  default = "ami-0a9d27a9f4f5c0efc"
}


variable "USERNAME" {
  default = "ubuntu"
}

variable "PUBLIC_KEY" {
  default = "sshkey.pub"
}

variable "PRIVATE_KEY" {
  default = "sshkey"
}