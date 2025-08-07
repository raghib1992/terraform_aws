resource "aws_vpc" "custom_vpc" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "main"
    }
}

resource "aws_subnet" "public_1a" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "${var.AWS_REGION}a"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "public-1a"
    }  
}

resource "aws_subnet" "private_1a" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "${var.AWS_REGION}a"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "private-1a"
    }  
}

resource "aws_subnet" "public_1b" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "${var.AWS_REGION}b"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "public-1b"
    }  
}

resource "aws_subnet" "private_1b" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "${var.AWS_REGION}b"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "private-1b"
    }  
}

resource "aws_internet_gateway" "custom_ig" {
    vpc_id = aws_vpc.custom_vpc.id
    tags = {
        Name = "custom_ig"
    }
}

# Route table to attach public route table
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.custom_vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.custom_ig.id
    }
    tags = {
      "Name" = "public_route_table"
    }
}

# Route table associate with public subnet
resource "aws_route_table_association" "public-1a-route" {
    subnet_id = aws_subnet.public_1a.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public-1b-route" {
    subnet_id = aws_subnet.public_1b.id
    route_table_id = aws_route_table.public_route_table.id
}