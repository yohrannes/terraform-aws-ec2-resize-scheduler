resource "aws_lambda_function" "ec2_downsize" {
  filename      = "${path.module}/lambda-functions/lambda-function-downsize.zip"
  function_name = "downsize-ec2-${lower(module.get_ec2_data.instance_name)}"
  description   = "downsize-ec2-${lower(module.get_ec2_data.instance_name)}"
  role          = module.iam_roles.lambda_downsize_role_arn
  handler       = "lambda-function-downsize.lambda_handler"
  runtime       = "python3.8"
  timeout       = 300

  environment {
    variables = {
      DESIRED_INSTANCE_TYPE = var.downsize_instance_type # Aways use the current instance type
      DESIRED_INSTANCE_ID = var.instance_id # Aways use the current instance id
    }
  }

  depends_on = [null_resource.zip_lambda_functions]
}

resource "aws_lambda_function" "ec2_resize" {
  filename      = "${path.module}/lambda-functions/lambda-function-resize.zip"
  function_name = "resize-ec2-${lower(module.get_ec2_data.instance_name)}"
  description   = "resize-ec2-${lower(module.get_ec2_data.instance_name)}"
  role          = module.iam_roles.lambda_resize_role_arn
  handler       = "lambda-function-resize.lambda_handler"
  runtime       = "python3.8"
  timeout       = 300

  environment {
    variables = {
      DESIRED_INSTANCE_TYPE = var.desired_instance_type # The desired instance type
      DESIRED_INSTANCE_ID = var.instance_id # Aways use the current instance id
    }
  }

  depends_on = [null_resource.zip_lambda_functions]
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = module.event_bridge_triggers.cron_trigger_resize_name
  target_id = "ec2-auto-resize-lambda${lower(module.get_ec2_data.instance_name)}"
  arn       = aws_lambda_function.ec2_resize.arn
}

resource "aws_cloudwatch_event_target" "lambda_target_downsize" {
  rule      = module.event_bridge_triggers.cron_trigger_downsize_name
  target_id = "ec2-auto-downsize-lambda${lower(module.get_ec2_data.instance_name)}"
  arn       = aws_lambda_function.ec2_downsize.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge${lower(module.get_ec2_data.instance_name)}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ec2_resize.function_name
  principal     = "events.amazonaws.com"
  source_arn    = module.event_bridge_triggers.cron_trigger_resize_arn
}

resource "aws_lambda_permission" "allow_eventbridge_downsize" {
  statement_id  = "AllowExecutionFromEventBridge${lower(module.get_ec2_data.instance_name)}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ec2_downsize.function_name
  principal     = "events.amazonaws.com"
  source_arn    = module.event_bridge_triggers.cron_trigger_downsize_arn
}