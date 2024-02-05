variable "bucket_name" {
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
}

variable "cloudfront_distribution_id" {
  description = "cloudfront_distribution_id"
}

variable "cloudfront_oai_id" {
  description = "cloudfront_oai_id"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}