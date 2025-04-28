# terraform-aws-ec2-resize-scheduler

## Use example:

```
module "auto_resize_instance_a" {
  source                 = "yohrannes/ec2-resize-scheduler/aws"
  instance_id            = "<INSTANCE_ID>"
  cron_resize            = "30 01 ? * MON-FRI *"
  desired_instance_type  = "t2.micro"
  cron_downsize          = "35 01 ? * * *"
  downsize_instance_type = "t2.nano"
  aws_region             = var.aws_region
  aws_profile            = var.aws_profile
}

module "auto_resize_instance_b" {
  source                 = "yohrannes/ec2-resize-scheduler/aws"
  instance_id            = "<INSTANCE_ID>"
  cron_resize            = "30 01 ? * MON-FRI *"
  desired_instance_type  = "t2.micro"
  cron_downsize          = "35 01 ? * * *"
  downsize_instance_type = "t2.nano"
  aws_region             = var.aws_region
  aws_profile            = var.aws_profile
}

#module "auto_resize_inst......
```