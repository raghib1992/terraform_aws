resource "aws_subnet" "public_main" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "public_main"
    }  
}

resource "aws_subnet" "private_main_1" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "private_main_1"
    }  
}

resource "aws_subnet" "private_main_2" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "private_main_2"
    }  
}

resource "aws_subnet" "private_main_3" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "private_main_3"
    }  
}