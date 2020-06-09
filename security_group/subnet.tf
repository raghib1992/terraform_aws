resource "aws_subnet" "public_main" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "public_main"
    }  
}

resource "aws_subnet" "private_main" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "private_main"
    }  
}