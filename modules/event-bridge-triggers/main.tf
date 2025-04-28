resource "aws_cloudwatch_event_rule" "cron_trigger_resize" {
  name                = "ec2_resize_rule_${lower(var.instance_name)}"
  description         = "ec2_resize_rule_${lower(var.instance_name)}"
  schedule_expression = "cron(${var.cron_resize})"
}

resource "aws_cloudwatch_event_rule" "cron_trigger_downsize" {
  name                = "ec2_downsize_rule_${lower(var.instance_name)}"
  description         = "ec2_downsize_rule_${lower(var.instance_name)}"
  schedule_expression = "cron(${var.cron_downsize})"
}