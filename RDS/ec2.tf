resource "aws_instance" "ebs_test" {
    ami = "ami-0447a12f28fddb066"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_main.id
    vpc_security_group_ids = ["${aws_security_group.secure_region.id}"]
    key_name = "pro_key"
    tags = {
        Name = "admin"
    }
}
