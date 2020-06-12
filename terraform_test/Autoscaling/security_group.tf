# create VPC
resource "aws_vpc" "web_server" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"

}

#Create security group
resource "aws_security_group" "secure_duniya" {
  vpc_id = aws_vpc.web_server.id
  name = "ssh"
  description = "to connect meter on ssh"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}