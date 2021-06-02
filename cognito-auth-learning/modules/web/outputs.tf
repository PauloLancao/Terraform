# -----------------------------------------------------------------------------
# Variables: Cloudfront
# -----------------------------------------------------------------------------

# output.cloudfront_distribution_domain_name
output "cloudfront_distribution_domain_name" {
  value = local.enabled == 1 ? aws_cloudfront_distribution._.0.domain_name : ""
}

# output.cloudfront_distribution_hosted_zone_id
output "cloudfront_distribution_hosted_zone_id" {
  value = local.enabled == 1 ? aws_cloudfront_distribution._.0.hosted_zone_id : ""
}