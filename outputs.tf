output "instance_name" {
  description = "The instance name to be used in the policy"
  value       = module.get_ec2_data.instance_name
}

output "atual_instance_type" {
  description = "The instance type to be used in the policy"
  value       = module.get_ec2_data.instance_type
}

output "cron_trigger_resize" {
  description = "The cron expression for the resize event"
  value       = var.cron_resize
}

output "cron_trigger_downsize" {
  description = "The cron expression for the downsize event"
  value       = var.cron_downsize
}