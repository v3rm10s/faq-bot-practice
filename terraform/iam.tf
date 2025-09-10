# This IAM role allows App Runner to access ECR.
resource "aws_iam_role" "apprunner_ecr_role" {
  name = "${var.service_name}-ecr-access-role"

  # The assume_role_policy allows the App Runner service to "assume" this role.
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "tasks.apprunner.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

# This policy attachment grants the role the necessary permissions
# to pull images from ECR.
resource "aws_iam_role_policy_attachment" "apprunner_ecr_access" {
  role       = aws_iam_role.apprunner_ecr_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}
