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
# Variables: Cognito
# -----------------------------------------------------------------------------

# var.cognito_user_pool_id
variable "cognito_user_pool_id" {
  description = "Cognito user pool identifier"
}

# var.cognito_user_pool_arn
variable "cognito_user_pool_arn" {
  description = "Cognito user pool ARN"
}

# var.cognito_identity_pool_name
variable "cognito_identity_pool_name" {
  description = "Cognito identity pool name"
}

# var.cognito_identity_pool_provider
variable "cognito_identity_pool_provider" {
  description = "Cognito identity pool provider"
}

# -----------------------------------------------------------------------------
# Outputs: SNS
# -----------------------------------------------------------------------------

# output.sns_topic_arn
variable "sns_topic_arn" {
  description = "SNS topic ARN"
}

# -----------------------------------------------------------------------------
# Variables: SES
# -----------------------------------------------------------------------------

# var.ses_sender_address
variable "ses_sender_address" {
  description = "SES sender email address"
  default     = ""
}