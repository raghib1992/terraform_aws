# create VPC
resource "aws_vpc" "web_server" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"

}

#Create Internet Gateway
resource "aws_internet_gateway" "IGW_webserver" {
  vpc_id = aws_vpc.web_server.id
}

#Create Route table
resource "aws_route_table" "public_main" {
  vpc_id = aws_vpc.web_server.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.IGW_webserver.id
  }
 
}

#Associate route table with public subnet
resource "aws_route_table_association" "public_table" {
  subnet_id = aws_route_table.public_main.id
  route_table_id = aws_route_table.public_main.id
}
#Create security group
resource "aws_security_group" "myinstance" {
  vpc_id = aws_vpc.web_server.id
  name = "myinstance"
  description = "testing elb"
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
  
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = ["${aws_security_group.elb_secure.id}"]
  }
  tags = {
      Name = "myinstance"
  }
}

resource "aws_security_group" "elb_secure" {
    vpc_id = aws_vpc.web_server.id
    name = "elb_secure"
    description = "testing elb"
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
  tags = {
      Name = "elb_secure"
  }
}