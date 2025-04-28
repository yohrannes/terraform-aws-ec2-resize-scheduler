variable "instance_name" {
  description = "The instance ID to be used in the policy"
  type        = string
}

variable "cron_resize" {
  description = "The cron expression for the resize event"
  type        = string
}

variable "cron_downsize" {
  description = "The cron expression for the downsize event"
  type        = string
}