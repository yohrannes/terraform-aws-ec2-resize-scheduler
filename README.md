# terraform-aws-ec2-resize-scheduler

## How to provide

### Required tools
- Terraform
- AWS Account

### Usage example:

```
module "auto_resize_instance_a" {
  source                 = "yohrannes/ec2-resize-scheduler/aws"
  instance_id            = "<INSTANCE_ID>"
  cron_resize            = "30 01 ? * MON-FRI *"
  desired_instance_type  = "t2.micro"
  cron_downsize          = "35 01 ? * * *"
  downsize_instance_type = "t2.nano"
  aws_region             = <AWS_REGION_ID>
  aws_profile            = <AWS_PROFILE_NAME>
}

module "auto_resize_instance_b" {
  source                 = "yohrannes/ec2-resize-scheduler/aws"
  instance_id            = "INSTANCE_ID"
  cron_resize            = "30 01 ? * MON-FRI *"
  desired_instance_type  = "t2.micro"
  cron_downsize          = "35 01 ? * * *"
  downsize_instance_type = "t2.nano"
  aws_region             = "AWS_REGION_ID"
  aws_profile            = "AWS_PROFILE_NAME"
}

#module "auto_resize_instance_x....
```

### Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli), recommend to use official doc's.

### Provision infrastructure with terraform.
```
terraform init
terraform plan
terraform apply
```