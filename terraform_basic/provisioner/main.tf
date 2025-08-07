resource "aws_key_pair" "mykey" {
    key_name = "test-key"
    public_key = "${file(var.PUBLIC_KEY)}"
}

resource "aws_instance" "ec2_terra" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = aws_key_pair.mykey.key_name

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/script.sh",
        "sudo /tmp/script.sh"
    ]
  }

  connection {
    user = var.USERNAME
    private_key = "${file("${var.PRIVATE_KEY}")}"
    host = coalesce(self.public_ip, self.private_ip)
  }
}