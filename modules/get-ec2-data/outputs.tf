output "instance_name" {
  value = data.aws_instance.selected_instance.tags["Name"]
}

output "instance_type" {
  value = data.aws_instance.selected_instance.instance_type
}