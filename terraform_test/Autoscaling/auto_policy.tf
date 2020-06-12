resource "aws_autoscaling_policy" "auto_policy" {
    name = "auto_policy"
    autoscaling_group_name = aws_autoscaling_group.first_autoscaling.name
    adjustment_type = "ChangeInCapacity"
    scaling_adjustment = "1"
    cooldown = "120"
    policy_type = "SimpleScaling"
}
