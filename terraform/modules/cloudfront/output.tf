output "cloudfront_distribution_id" {
  description = "The identifier for the CloudFront distribution."
  value       = aws_cloudfront_distribution.distribution.id
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution."
  value       = aws_cloudfront_distribution.distribution.domain_name
}
