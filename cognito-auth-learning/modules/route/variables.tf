# -----------------------------------------------------------------------------
# Variables: General
# -----------------------------------------------------------------------------

# var.namespace
variable "namespace" {
  description = "AWS resource namespace/prefix"
}

# var.region
variable "region" {
  description = "AWS region"
}

# -----------------------------------------------------------------------------
# Variables: Application
# -----------------------------------------------------------------------------

# var.app_hosted_zone_id
variable "app_hosted_zone_id" {
  description = "Application hosted zone identifier"
}

# var.app_domain
variable "app_domain" {
  description = "Application domain"
}

# -----------------------------------------------------------------------------
# Variables: Cloudfront
# -----------------------------------------------------------------------------

# var.cloudfront_distribution_domain_name
/**
variable "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name"
}

# var.cloudfront_distribution_hosted_zone_id
variable "cloudfront_distribution_hosted_zone_id" {
  description = "CloudFront distribution hosted zone identifier"
}
*/