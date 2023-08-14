provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for www.salvagg.io"
}

# --- Route53 Zone Configuration ---

# Route 53 hosted zone for salvagg.io domain
resource "aws_route53_zone" "salvagg" {
  name = "salvagg.io"
}

resource "aws_route53_record" "root_a_record" {
  zone_id = aws_route53_zone.salvagg.zone_id
  name    = "salvagg.io"
  type    = "A"

  alias {
    name                   = "dksdfpmycu3ow.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "acm_validation_1" {
  zone_id = aws_route53_zone.salvagg.zone_id
  name    = "_d6f277db4dfe3846c7c9713f761ce777.salvagg.io"
  type    = "CNAME"
  ttl     = 300
  records = ["_75c4f2ff40691e7bd462ba1730b02530.dflhkvdxlx.acm-validations.aws."]
}

resource "aws_route53_record" "www_cname" {
  zone_id = aws_route53_zone.salvagg.zone_id
  name    = "www.salvagg.io"
  type    = "CNAME"
  ttl     = 300
  records = ["d3meggtvm23yxd.cloudfront.net"]
}

resource "aws_route53_record" "acm_validation_2" {
  zone_id = aws_route53_zone.salvagg.zone_id
  name    = "_2167e5d85c3b22f03c3ae4364aec2946.www.salvagg.io"
  type    = "CNAME"
  ttl     = 300
  records = ["_3d673a44c111d7721e66c28901314c62.dflhkvdxlx.acm-validations.aws."]
}

# --- S3 Buckets ---

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::www.salvagg.io/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
    }
  }
}

# S3 bucket to serve www content
resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.salvagg.io"

  policy = data.aws_iam_policy_document.s3_policy.json

  # Server-side encryption using AES256
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    project = "salvagg.io"
  }
}

resource "aws_s3_bucket_website_configuration" "www_bucket_website" {
  bucket = aws_s3_bucket.www_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

# S3 bucket for redirecting root domain to www
resource "aws_s3_bucket" "redirect_bucket" {
  bucket = "salvagg.io"

  # Policy to allow public read access
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::salvagg.io/*"
      }
    ]
  })

  # Server-side encryption using AES256
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    project = "salvagg.io"
  }
}

resource "aws_s3_bucket_website_configuration" "redirect_bucket_website" {
  bucket = aws_s3_bucket.redirect_bucket.bucket

  redirect_all_requests_to {
    host_name = "www.salvagg.io"
    protocol  = "https"
  }
}

# --- CloudFront Distributions ---

# General configuration for CloudFront Distributions
locals {
  common_distribution_config = {
    enabled         = true
    is_ipv6_enabled = true
    http_version    = "http2and3"
    price_class     = "PriceClass_All"

    aliases = ["salvagg.io", "www.salvagg.io"] # Define the domain aliases here

    # Standard cache behavior for static websites
    default_cache_behavior = {
      allowed_methods = ["GET", "HEAD"]
      cached_methods  = ["GET", "HEAD"]
      compress        = true

      forwarded_values = {
        query_string = false
        cookies = {
          forward = "none"
        }
      }

      viewer_protocol_policy = "redirect-to-https"
    }

    # No geographical restrictions
    restrictions = {
      geo_restriction = {
        restriction_type = "none"
      }
    }

    # Using ACM certificate for HTTPS
    viewer_certificate = {
      acm_certificate_arn      = "arn:aws:acm:us-east-1:669948573359:certificate/2c47534f-fa3c-4e83-bcea-456d9b07120e"
      ssl_support_method       = "sni-only"
      minimum_protocol_version = "TLSv1.2_2021"
    }
  }
}

# CloudFront distribution to serve www content
resource "aws_cloudfront_distribution" "www_distribution" {
  # Merging the common config with specific config for www
  dynamic "origin" {
    for_each = [{
      domain_name = aws_s3_bucket.www_bucket.bucket_regional_domain_name
      origin_id   = aws_s3_bucket.www_bucket.bucket_regional_domain_name
    }]

    content {
      domain_name = origin.value.domain_name
      origin_id   = origin.value.origin_id

      s3_origin_config {
        origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
      }
    }
  }

  default_root_object = "index.html"

  # Merge in common distribution configuration
  dynamic "default_cache_behavior" {
    for_each = [merge(local.common_distribution_config.default_cache_behavior, {
      target_origin_id = aws_s3_bucket.www_bucket.bucket_regional_domain_name
    })]

    content {
      allowed_methods        = default_cache_behavior.value.allowed_methods
      cached_methods         = default_cache_behavior.value.cached_methods
      compress               = default_cache_behavior.value.compress
      target_origin_id       = default_cache_behavior.value.target_origin_id
      viewer_protocol_policy = default_cache_behavior.value.viewer_protocol_policy

      forwarded_values {
        query_string = default_cache_behavior.value.forwarded_values.query_string
        cookies {
          forward = default_cache_behavior.value.forwarded_values.cookies.forward
        }
      }
    }
  }

  aliases         = ["www.salvagg.io"]
  enabled         = local.common_distribution_config.enabled
  is_ipv6_enabled = local.common_distribution_config.is_ipv6_enabled
  http_version    = local.common_distribution_config.http_version
  price_class     = local.common_distribution_config.price_class

  viewer_certificate {
    acm_certificate_arn      = local.common_distribution_config.viewer_certificate.acm_certificate_arn
    ssl_support_method       = local.common_distribution_config.viewer_certificate.ssl_support_method
    minimum_protocol_version = local.common_distribution_config.viewer_certificate.minimum_protocol_version
  }

  restrictions {
    geo_restriction {
      restriction_type = local.common_distribution_config.restrictions.geo_restriction.restriction_type
    }
  }
}

## CloudFront distribution to handle redirects from root domain to www
resource "aws_cloudfront_distribution" "redirect_distribution" {
  # Merging the common config with specific config for redirect
  dynamic "origin" {
    for_each = [{
      domain_name = "${aws_s3_bucket.redirect_bucket.bucket}.s3-website-us-east-1.amazonaws.com"
      origin_id   = aws_s3_bucket.redirect_bucket.bucket_regional_domain_name
    }]

    content {
      domain_name = origin.value.domain_name
      origin_id   = origin.value.origin_id

      custom_origin_config {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
    }
  }

  # Merge in common distribution configuration
  dynamic "default_cache_behavior" {
    for_each = [merge(local.common_distribution_config.default_cache_behavior, {
      target_origin_id = aws_s3_bucket.redirect_bucket.bucket_regional_domain_name
    })]

    content {
      allowed_methods        = default_cache_behavior.value.allowed_methods
      cached_methods         = default_cache_behavior.value.cached_methods
      compress               = default_cache_behavior.value.compress
      target_origin_id       = default_cache_behavior.value.target_origin_id
      viewer_protocol_policy = default_cache_behavior.value.viewer_protocol_policy

      forwarded_values {
        query_string = default_cache_behavior.value.forwarded_values.query_string
        cookies {
          forward = default_cache_behavior.value.forwarded_values.cookies.forward
        }
      }
    }
  }

  aliases         = ["salvagg.io"]
  enabled         = local.common_distribution_config.enabled
  is_ipv6_enabled = local.common_distribution_config.is_ipv6_enabled
  http_version    = local.common_distribution_config.http_version
  price_class     = local.common_distribution_config.price_class

  viewer_certificate {
    acm_certificate_arn      = local.common_distribution_config.viewer_certificate.acm_certificate_arn
    ssl_support_method       = local.common_distribution_config.viewer_certificate.ssl_support_method
    minimum_protocol_version = local.common_distribution_config.viewer_certificate.minimum_protocol_version
  }

  restrictions {
    geo_restriction {
      restriction_type = local.common_distribution_config.restrictions.geo_restriction.restriction_type
    }
  }
}