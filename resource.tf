resource "aws_instance" "test_remote_provisioner" {
    ami = "ami-0470e33cd681b2476"
    instance_type = "t2.micro"
    key_name = "raghiba"
    tags = {
        Name = "test_remote_provisioner"
    }
  
}

resource "aws_eip" "firsteip" {
    instance = aws_instance.test_remote_provisioner.id 
}

output "firsteip" {
  value = aws_eip.firsteip.public_ip
}

resource "null_resource" "ec2_ssh_connection" {
    connection {
        host = aws_eip.firsteip.public_ip
        type = "ssh"
        port = 22
        user = "ec2-user"
        private_key = file("mykey.pem")
        timeout = "1m"
        agent = false
    }

    provisioner "file" {
        source = "index.html"
        destination = "/home/ec2-user/index.html"

    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y",
            "sudo yum install httpd -y",
            "sudo systemctl start httpd",
            "sudo systemctl enable httpd",
            "sudo cp /home/ec2-user/index.html /var/www/html/index.html",
        ]

    }
 
}
