resource "aws_cloudfront_distribution" "distribution" {
  depends_on = [aws_cloudfront_origin_access_identity.oai]
  origin {
    domain_name = var.origin_domain_name
    origin_id   = var.origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.p81-OAC.id
    }
  

  enabled = true

  default_cache_behavior {
    target_origin_id       = var.origin_id
    viewer_protocol_policy = "allow-all"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600  # Default time-to-live (in seconds)
    max_ttl                = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Description = "devops assignment p81"
    Type        = "dev"
  }
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for CloudFront"
}

resource "aws_cloudfront_origin_access_control" "p81-OAC" {
  name                              = "${var.origin_id}-OAC"
  description                       = "OAC for p81 - CloudFront"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}