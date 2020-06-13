#Classic Load Balancer

resource "aws_elb" "firstelb" {
    name = "firstelb"
    subnets = ["${aws_subnet.public_main_1.id}", "${aws_subnet.public_main_2.id}"]
    security_groups = ["${aws_security_group.elb_secure.name}"]
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "HTTP:80/"
        interval = 30
    }
    instances = ["${aws_launch_configuration.elb_test.id}"]
    cross_zone_load_balancing = true
    connection_draining = true
    connection_draining_timeout = 400
    tags = {
        Name = "firstelb"
    } 
}