resource "aws_instance" "ebs_test" {
    availability_zone = "ap-south-1a"
    ami = "ami-0447a12f28fddb066"
    instance_type = "t2.micro"
    tags = {
        Name = "admin"
    }
}
