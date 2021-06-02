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
# Variables: API Gateway
# -----------------------------------------------------------------------------

# var.api_id
variable "api_id" {
  description = "API identifier"
}

# var.api_stage
variable "api_stage" {
  description = "API deployment stage"
}

# var.api_base_path
variable "api_base_path" {
  description = "API base path"
}

# -----------------------------------------------------------------------------
# Variables: Application
# -----------------------------------------------------------------------------

# var.app_hosted_zone_id
variable "app_hosted_zone_id" {
  description = "Application hosted zone identifier"
}

# var.app_certificate_arn
variable "app_certificate_arn" {
  description = "Application domain certificate ARN"
}

# var.app_domain
variable "app_domain" {
  description = "Application domain"
}

# var.app_origin
variable "app_origin" {
  description = "Application origin"
}

# -----------------------------------------------------------------------------
# Variables: Cognito
# -----------------------------------------------------------------------------

# var.cognito_identity_pool_name
variable "cognito_identity_pool_name" {
  description = "Cognito identity pool name"
}

# -----------------------------------------------------------------------------
# Variables: S3
# -----------------------------------------------------------------------------

# var.bucket
variable "bucket" {
  description = "S3 bucket name"
}