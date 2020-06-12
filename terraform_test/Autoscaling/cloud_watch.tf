resource "aws_cloudwatch_metric_alarm" "watch_autoscaling" {
    alarm_name = "watch_autoscaling"
    alarm_description = "watch_autoscaling"
    comparison_operator = "greaterThanEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "30"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.first_autoscaling.name
    }
    actions_enabled = true
    alarm_actions = ["${aws_autoscaling_group.first_autoscaling.arn}"]
}