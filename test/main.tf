provider "aws" {
  
}

variable "AWS_REGION" {
  type = string
}
variable "AMIS" {
    type = map(string)
    default = {
        ap-south-1 = "my ami"
    }
}

resource "aws_instance" "test_terraform" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "ts.micro"
}