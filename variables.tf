variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "my-terraform-bucket"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}
