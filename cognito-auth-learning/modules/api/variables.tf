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

# var.cognito_user_pool_client_id
variable "cognito_user_pool_client_id" {
  description = "Cognito user pool client identifier"
}

# var.cognito_identity_pool_provider
variable "cognito_identity_pool_provider" {
  description = "Cognito identity pool provider"
}