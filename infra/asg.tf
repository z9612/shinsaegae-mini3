resource "aws_autoscaling_group" "web" {
  name                 = "${aws_launch_configuration.web.name}-asg"
  min_size             = 1
  desired_capacity     = 2
  max_size             = 4
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.web.name
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
  metrics_granularity = "1Minute"
  vpc_zone_identifier = aws_subnet.private_subnets.*.id
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }

  #사용하는 Application Load Balancer의 ID를 직접 지정합니다.
  target_group_arns = [
    aws_lb_target_group.asg_tg.arn,
    aws_lb_target_group.terraform-prometheus-tg.arn,
    aws_lb_target_group.terraform-grafana-tg.arn
  ]
}

resource "aws_autoscaling_group" "was" {
  name                 = "${aws_launch_configuration.was.name}-asg"
  min_size             = 1
  desired_capacity     = 2
  max_size             = 4
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.was.name
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
  metrics_granularity = "1Minute"
  vpc_zone_identifier = aws_subnet.private_subnets.*.id
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "was"
    propagate_at_launch = true
  }

  #사용하는 Internal Application Load Balancer의 ID를 직접 지정합니다.
  target_group_arns = [aws_lb_target_group.internal_asg_tg.arn]
}
