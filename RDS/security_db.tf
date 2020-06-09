resource "aws_security_group" "db" {
  vpc_id = aws_vpc.custom_vpc.id
  name = "allow_web"
  description = "allow_web"
  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      security_groups = ["${aws_security_group.secure_region.id}"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self = true
  }
  tags = {
      Name = "db"
  }
}
