resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  # Use the ACL "private" to restrict public access
  acl = "private"

  # Enable versioning if specified
  versioning {
    enabled = var.versioning
  }

  tags = merge(
    var.tags,
    {
      "Name" = "p81-CloudFront",
      "Owner" = "Alon Carmelly",
      "Terraform" = "True"
    }
  )
}

# OAI for CloudFront (Origin Access Identity)
resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.bucket_name}"
}

# Update the bucket policy to allow CloudFront
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipalReadOnly",
        Effect    = "Allow",
        Principal = { Service = "cloudfront.amazonaws.com" },
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${var.bucket_name}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "arn:aws:cloudfront::${var.aws_account_id}:distribution/${aws_cloudfront_origin_access_identity.oai.id}"
          }
        }
      }
    ]
  })
}
