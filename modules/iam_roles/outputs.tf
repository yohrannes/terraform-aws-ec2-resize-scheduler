output "lambda_downsize_role_arn" {
  value = aws_iam_role.lambda_downsize_role.arn
}

output "lambda_resize_role_arn" {
  value = aws_iam_role.lambda_resize_role.arn
}