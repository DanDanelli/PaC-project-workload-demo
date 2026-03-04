variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name: sandbox, non-prd, prd"
  type        = string
  validation {
    condition     = contains(["sandbox", "non-prd", "prd"], var.environment)
    error_message = "Environment must be one of: sandbox, non-prd, prd"
  }
}

variable "project_name" {
  description = "Project name used for tagging and naming resources"
  type        = string
}

variable "owner" {
  description = "Owner team email for tagging"
  type        = string
}

variable "cost_center" {
  description = "Cost center for billing allocation"
  type        = string
}
