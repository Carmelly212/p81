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

// q: what is the purpose of the origin_domain_name and where to get it from?

// q:  where to use origin_domain_name and origin_id? 




