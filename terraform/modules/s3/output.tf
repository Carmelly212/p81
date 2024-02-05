# outputs to be used later as environment variables
output "bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "The ARN of the bucket."
  value       = aws_s3_bucket.bucket.arn
}
