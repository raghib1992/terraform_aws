#Instance Data
data "aws_ami" "centos" {
  most_recent      = true
 
  filter {
    name   = "name"
    values = ["myami-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}

resource "aws_instance" "test" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"
}