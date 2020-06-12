resource "aws_sns_topic" "notification" {
    name = "notification"
    display_name = "notification"
}

resource "aws_autoscaling_notification" "linked" {
    group_names = ["${aws_autoscaling_group.first_autoscaling.name}"]
    topic_arn = aws_sns_topic.notification.arn
    notifications = [
        "autoscaling:EC2_INSTANCE_LAUNCH",
        "autoscaling:EC2_INSTANCE_TERMINATE",
        "autoscaling:EC2_INSTANCE_ERROR",
    ]
}