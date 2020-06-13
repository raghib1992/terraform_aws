resource "aws_launch_configuration" "elb_test" {
    name_prefix = "elb_test"
    image_id = "ami-0447a12f28fddb066"
    instance_type = "t2.micro"
    key_name  = "pro_key"
    security_groups = ["${aws_security_group.myinstance.id}"]
}

resource "aws_autoscaling_group" "elb_auto" {
    name = "elb_auto"
    vpc_zone_identifier = ["${aws_subnet.public_main_1.id}","${aws_subnet.public_main_2.id}"]
    launch_configuration = aws_launch_configuration.elb_test.id
    min_size = 2
    max_size = 3
    health_check_grace_period = 60
    health_check_type = "ELB"
    load_balancers = ["${aws_elb.firstelb.name}"]
    force_delete = true
    tag {
        key = "Name"
        value = "ec2instance"
        propagate_at_launch = true
    }
}