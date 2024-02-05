variable "origin_domain_name" {
  description = "The DNS domain name of the S3 bucket or other origin."
  type        = string
}

variable "origin_id" {
  description = "Unique identifier for the origin."
  type        = string
}


variable "cloudfront_distribution_id" {
  description = "The CloudFront Distribution ID"
  type        = string
  default     = "some-default-value"  # Only if a sensible default is possible
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}


