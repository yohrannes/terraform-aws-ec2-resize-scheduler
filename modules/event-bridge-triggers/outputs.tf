output "cron_trigger_resize_name" {
  value = aws_cloudwatch_event_rule.cron_trigger_resize.name
}
output "cron_trigger_downsize_name" {
  value = aws_cloudwatch_event_rule.cron_trigger_downsize.name
}
output "cron_trigger_resize_arn" {
  value = aws_cloudwatch_event_rule.cron_trigger_resize.arn
}
output "cron_trigger_downsize_arn" {
  value = aws_cloudwatch_event_rule.cron_trigger_downsize.arn
}