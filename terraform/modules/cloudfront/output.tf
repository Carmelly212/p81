# outputs to be used later as environment variables
output "cloudfront_distribution_id" {
  description = "The identifier for the distribution."
  value       = try(aws_cloudfront_distribution.distribution.id, "")
}

output "cloudfront_distribution_arn" {
  description = "The ARN (Amazon Resource Name) for the distribution."
  value       = try(aws_cloudfront_distribution.distribution.arn, "")
}

output "cloudfront_url" {
  value = try(aws_cloudfront_distribution.distribution.domain_name, "")
}

output "cloudfront_oai_id" {
  description = "The identifier for the OAI."
  value       = try(aws_cloudfront_origin_access_identity.oai.id, "")
}

output "aws_cloudfront_origin_access_control" {
  description = "The identifier for the OAC."
  value       = try(aws_cloudfront_origin_access_control.p81-OAC.id, "")
}
