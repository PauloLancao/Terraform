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

# var.api_stage
variable "api_stage" {
  description = "API deployment stage"
  default     = "production"
}

# -----------------------------------------------------------------------------
# Variables: Application
# -----------------------------------------------------------------------------

# var.app_hosted_zone_id
variable "app_hosted_zone_id" {
  description = "Application hosted zone identifier"
  default     = ""
}

# var.app_certificate_arn
variable "app_certificate_arn" {
  description = "Application domain certificate ARN"
  default     = ""
}

# var.app_domain
variable "app_domain" {
  description = "Application domain"
  default     = ""
}

# var.app_origin
variable "app_origin" {
  description = "Application origin"
  default     = ""
}

# -----------------------------------------------------------------------------
# Variables: Cognito
# -----------------------------------------------------------------------------

# var.cognito_identity_pool_name
variable "cognito_identity_pool_name" {
  description = "Cognito identity pool name"
}

# var.cognito_identity_pool_provider
variable "cognito_identity_pool_provider" {
  description = "Cognito identity pool provider"
}

# -----------------------------------------------------------------------------
# Variables: SES
# -----------------------------------------------------------------------------

# var.ses_sender_address
variable "ses_sender_address" {
  description = "SES sender email address"
  default     = ""
}

# -----------------------------------------------------------------------------
# Variables: S3
# -----------------------------------------------------------------------------

# var.bucket
variable "bucket" {
  description = "S3 bucket name"
  default     = ""
}