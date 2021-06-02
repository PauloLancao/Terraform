# -----------------------------------------------------------------------------
# Local variables
# -----------------------------------------------------------------------------

# local.*
locals {
  enabled = length(var.app_domain) == 0 ? 0 : 1
}

# -----------------------------------------------------------------------------
# Resources: Route 53
# -----------------------------------------------------------------------------

# aws_route53_record._
resource "aws_route53_record" "_" {
  count   = local.enabled
  zone_id = var.app_hosted_zone_id
  name    = var.app_domain
  type    = "A"

  /**
  alias {
    zone_id = var.cloudfront_distribution_hosted_zone_id
    name    = var.cloudfront_distribution_domain_name

    evaluate_target_health = false
  }
  */
}