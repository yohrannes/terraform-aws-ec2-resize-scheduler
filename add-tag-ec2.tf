resource "aws_ec2_tag" "desired_instance_type" {
  resource_id = var.instance_id
  key         = "REQ_INSTANCE_TYPE"
  value       = var.desired_instance_type
}