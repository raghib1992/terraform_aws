resource "aws_key_pair" "sshkey" {
    key_name = "sshkey"
    public_key = "${file(var.PUBLIC_KEY)}"
}

resource "aws_instance" "example" {
    ami = "${var.AMIS}"
    instance_type = "t2.micro"
    key_name = aws_key_pair.sshkey.key_name
    tags = {
        Name = "terraform"
    }
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

output "public_ip" {
    value = "${aws_instance.example.public_ip}"  
}