variable "aws_region" { default = "eu-west-1" }
variable "project_name" { default = "personal-homepage" }

provider "aws" { region = "${var.aws_region}" }
terraform {
  backend "s3" {
    bucket = "personal-homepage-terraform"
    key = "terraform.tfstate"
    region = "eu-west-1"
  }
}

resource "aws_s3_bucket" "static" {
  bucket = "${var.project_name}-static"
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
  acl = "public-read"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": ["arn:aws:s3:::${var.project_name}-static/*"]
    }
  ]
}
EOF
}

resource "aws_cloudfront_distribution" "static" {
  depends_on = ["aws_s3_bucket.static"]
  enabled = true
  retain_on_delete = true
  is_ipv6_enabled = true

  origin {
    domain_name = "${var.project_name}-static.s3.amazonaws.com"
    origin_id = "${var.project_name}-static"
  }
  default_root_object = "index.html"

  aliases = ["anttiviljami.com", "www.anttiviljami.com"]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:921809084865:certificate/3826257b-a632-4215-99ce-2d758e44ae6e"
    ssl_support_method = "sni-only"
  }

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods = [ "GET", "HEAD", "OPTIONS" ]
    cached_methods = [ "GET", "HEAD" ]
    target_origin_id = "${var.project_name}-static"
    forwarded_values {
      query_string = true
      cookies {
        forward = "none"
      }
    }
    compress = true
    min_ttl = 0
    default_ttl = 360
    max_ttl = 86400
  }
}

output "Cloudfront Distribution URL" {
  value = "https://${aws_cloudfront_distribution.static.domain_name}"
}
