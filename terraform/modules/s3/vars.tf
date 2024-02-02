variable "bucket_name" {
  description = "The name of the bucket."
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "A state of versioning (should be true or false)."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

# variable "cloudfront_distribution_id" {
#   description = "The ID of the CloudFront distribution that can access the S3 bucket."
#   type        = string
# }
