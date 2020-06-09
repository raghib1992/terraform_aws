resource "aws_instance" "ebs_test" {
    ami = "ami-0447a12f28fddb066"
    instance_type = "t2.micro"
    key_name = "pro_key"
    tags = {
        Name = "ebs_test"
    }
}
