# Policy para o Lambda responsável por "resize"
resource "aws_iam_policy" "lambda_resize_policy" {
  name        = "lambda-resize-${lower(var.instance_name)}"
  description = "Policy for Lambda to resize EC2 instances"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "VisualEditor0",
        Effect = "Allow",
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances"
        ],
        Resource = "arn:aws:ec2:*:299391716392:instance/*"
      },
      {
        Sid    = "VisualEditor1",
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeRegions",
          "ec2:ModifyInstanceAttribute"
        ],
        Resource = "*"
      }
    ]
  })
}

# Policy para o Lambda responsável por "downsize"
resource "aws_iam_policy" "lambda_downsize_policy" {
  name        = "lambda-downsize-${lower(var.instance_name)}"
  description = "Policy for Lambda to downsize EC2 instances"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "VisualEditor0",
        Effect = "Allow",
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances"
        ],
        Resource = "arn:aws:ec2:*:299391716392:instance/*"
      },
      {
        Sid    = "VisualEditor1",
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeRegions",
          "ec2:ModifyInstanceAttribute"
        ],
        Resource = "*"
      }
    ]
  })
}

# Role para o Lambda responsável por "downsize"
resource "aws_iam_role" "lambda_downsize_role" {
  name = "lambda-downsize-${lower(var.instance_name)}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Role para o Lambda responsável por "resize"
resource "aws_iam_role" "lambda_resize_role" {
  name = "lambda-resize-${lower(var.instance_name)}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Anexando a política criada pelo módulo ao role "lambda_downsize"
resource "aws_iam_role_policy_attachment" "lambda_downsize_policy_attachment" {
  role       = aws_iam_role.lambda_downsize_role.name
  policy_arn = aws_iam_policy.lambda_downsize_policy.arn
}

# Anexando a política criada pelo módulo ao role "lambda_resize"
resource "aws_iam_role_policy_attachment" "lambda_resize_policy_attachment" {
  role       = aws_iam_role.lambda_resize_role.name
  policy_arn = aws_iam_policy.lambda_resize_policy.arn
}