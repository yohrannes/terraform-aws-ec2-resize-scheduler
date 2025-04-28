variable "desired_instance_type" {
  description = "The desired instance type for the EC2 instance."
  type        = string
}

variable "downsize_instance_type" {
  description = "The instance type to downsize to."
  type        = string
}
variable "instance_id" {
  description = "The ID of the EC2 instance."
  type        = string
}

variable "cron_resize" {
  description = "The cron expression for the resize event."
  type        = string
}

variable "cron_downsize" {
  description = "The cron expression for the downsize event."
  type        = string
}

variable "aws_region" {
  description = "The AWS region where resources are deployed."
  type        = string
}

variable "aws_profile" {
  description = "The AWS profile to use for authentication."
  type        = string
}
