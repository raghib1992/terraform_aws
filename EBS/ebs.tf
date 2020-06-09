resource "aws_ebs_volume" "extra_volume" {
  availability_zone = "ap-south-1a"
  size = 10
  type = "gp2"
  tags = {
      Name = "extra_volume"
  }
}

resource "aws_volume_attachment" "extra_volume_attachment" {
  device_name = "/dev/xvdh"
  volume_id = aws_ebs_volume.extra_volume.id
  instance_id = aws_instance.ebs_test.id
}

