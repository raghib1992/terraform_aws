resource "aws_eip" "main_eip" {
    vpc = true  
}

resource "aws_nat_gateway" "main_nat" {
    allocation_id = aws_eip.main_eip.id
    subnet_id = aws_subnet.public_1a.id
    tags = {
        Name = "main_nat"
    }
}

resource "aws_route_table" "main_private_table" {
    vpc_id = aws_vpc.custom_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.main_nat.id
    }
    tags = {
        Name = "main_private_table"
    }
}

resource "aws_route_table_association" "private_1a_table" {
    subnet_id = aws_subnet.private_1a.id
    route_table_id = aws_route_table.main_private_table.id
}

resource "aws_route_table_association" "private_1b_table" {
    subnet_id = aws_subnet.private_1b.id
    route_table_id = aws_route_table.main_private_table.id
}

resource "aws_route_table_association" "private_1c_table" {
    subnet_id = aws_subnet.private_1c.id
    route_table_id = aws_route_table.main_private_table.id
}