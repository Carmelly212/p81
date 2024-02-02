variable "origin_domain_name" {
  description = "The DNS domain name of the S3 bucket or other origin."
  type        = string
}

variable "origin_id" {
  description = "Unique identifier for the origin."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the distribution."
  type        = map(string)
  default     = {}
}
