resource "aws_subnet" "public_main_1" {
    vpc_id = aws_vpc.web_server.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "public_main_1"
    }  
}

resource "aws_subnet" "public_main_2" {
    vpc_id = aws_vpc.web_server.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "public_mai_2"
    }  
}