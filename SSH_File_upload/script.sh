#!/bin/bash
sudo su
yum install httpd -y
echo "HELLO TERRAFORM" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd