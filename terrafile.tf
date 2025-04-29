module "iam_roles" {
  source        = "./modules/iam_roles"
  instance_name = module.get_ec2_data.instance_name
  instance_id   = var.instance_id
  aws_region    = var.aws_region
}

module "event_bridge_triggers" {
  source        = "./modules/event-bridge-triggers"
  instance_name = module.get_ec2_data.instance_name
  cron_resize   = var.cron_resize
  cron_downsize = var.cron_downsize
}

module "get_ec2_data" {
  source      = "./modules/get-ec2-data"
  instance_id = var.instance_id
}