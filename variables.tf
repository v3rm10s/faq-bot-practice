variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-southeast-1"
}

variable "service_name" {
  description = "The name for the App Runner service."
  type        = string
  default     = "faq-bot-app"
}

variable "ecr_image_identifier" {
  description = "The full URI of the docker image in the private ECR repository."
  type        = string
  # Replace this with your actual ECR image URI
  default     = "129585230409.dkr.ecr.ap-southeast-1.amazonaws.com/faq-bot-practice:e29e8535fa0018c19af99a17c4247049f8cccef4"
}
