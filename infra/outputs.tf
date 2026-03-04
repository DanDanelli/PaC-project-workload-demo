output "s3_bucket_arn" {
  description = "ARN of the application data S3 bucket"
  value       = aws_s3_bucket.app_data.arn
}

output "s3_bucket_name" {
  description = "Name of the application data S3 bucket"
  value       = aws_s3_bucket.app_data.id
}
