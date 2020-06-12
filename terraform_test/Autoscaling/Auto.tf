resource "aws_launch_configuration" "first_launch" {
    name_prefix = "first_autoscaling"
    image_id = "ami-0447a12f28fddb066"
    instance_type = "t2.micro"
    key_name  = "pro_key"
    security_groups = ["${aws_security_group.secure_duniya.id}"]
}

resource "aws_autoscaling_group" "first_autoscaling" {
    name = "first_autoscaling"
    vpc_zone_identifier = ["${aws_subnet.public_main.id}"]
    launch_configuration = aws_launch_configuration.first_launch.id
    min_size = 2
    max_size = 3
    health_check_grace_period = 60
    health_check_type = "EC2"
    force_delete = true
    tag {
        key = "Name"
        value = "ec2instance"
        propagate_at_launch = true
    }
}