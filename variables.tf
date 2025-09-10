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

variable "image_tags" {
  description = "Tag for the project"
  type        = string
  default     = "MUTABLE"
}

variable "ecr_image_identifier" {
  description = "The full URI of the docker image in the private ECR repository."
  type        = string
}

variable "runner_cpu" {
  description = "The cpu specs for the aws runner."
  type        = number
  default     = 1024
}

variable "runner_memory" {
  description = "The memory specs for the aws runner."
  type        = number
  default     = 2048
}

variable "port" {
  description = "The port your FastAPI app listens on"
  type        = number
  default     = 8080
}

variable "resource_tags" {
  description = "Tag for the project"
  type        = map(string)
  default     = {
    Project     = "Fortress-API"
    Owner       = "AspiringRE"
    ManagedBy   = "Terraform"
}
}
