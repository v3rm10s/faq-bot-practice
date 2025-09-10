# Configure the AWS provider
provider "aws" {
  region = var.aws_region
}

# Define the App Runner service resource
resource "aws_apprunner_service" "faq_bot_service" {
  service_name = var.service_name

  source_configuration {
    # This block is required for App Runner to have permission
    # to pull the image from your private ECR repository.
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_ecr_role.arn
    }

    image_repository {
      image_identifier      = var.ecr_image_identifier
      image_repository_type = "ECR"

      image_configuration {
        port = "8080" # The port your FastAPI app listens on
      }
    }
    # Enabling auto-deployments is often desired for CI/CD workflows.
    # When a new image is pushed with the same tag, App Runner will automatically deploy it.
    auto_deployments_enabled = true
  }

  # It's best practice to define the compute instance size.
  # Otherwise, you get the default, which may not be what you need.
  instance_configuration {
    cpu    = "1024" # 1 vCPU
    memory = "2048" # 2 GB
  }

  # Adding a health check is crucial for production services.
  # App Runner uses this to verify your application is running correctly.
  health_check_configuration {
    protocol    = "TCP"
    interval    = 10
    timeout     = 5
    path        = "/" # Change if your health check endpoint is different
  }

  tags = {
    Project = "FAQ Bot"
    ManagedBy = "Terraform"
  }
}
