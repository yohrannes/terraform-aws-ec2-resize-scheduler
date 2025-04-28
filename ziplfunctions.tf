resource "null_resource" "zip_lambda_functions" {
  provisioner "local-exec" {
    command = <<EOT
      zip -j ${path.module}/lambda-functions/lambda-function-downsize.zip ${path.module}/lambda-functions/lambda-function-downsize.py
      zip -j ${path.module}/lambda-functions/lambda-function-resize.zip ${path.module}/lambda-functions/lambda-function-resize.py
    EOT
  }
}