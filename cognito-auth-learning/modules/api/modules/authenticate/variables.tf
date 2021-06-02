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

# var.api_resource_id
variable "api_resource_id" {
  description = "API resource identifier"
}

# output.api_base_path
variable "api_base_path" {
  description = "API base path"
}

# -----------------------------------------------------------------------------
# Variables: Cognito
# -----------------------------------------------------------------------------

# var.cognito_user_pool_id
variable "cognito_user_pool_id" {
  description = "Cognito user pool identifier"
}

# var.cognito_user_pool_client_id
variable "cognito_user_pool_client_id" {
  description = "Cognito user pool client identifier"
}

# var.cognito_identity_pool_provider
variable "cognito_identity_pool_provider" {
  description = "Cognito identity pool provider"
}

# -----------------------------------------------------------------------------
# Variables: DynamoDB
# -----------------------------------------------------------------------------

# var.dynamodb_table
variable "dynamodb_table" {
  description = "DynamoDB table"
}

# -----------------------------------------------------------------------------
# Resources: SNS
# -----------------------------------------------------------------------------

# var.sns_topic_arn
variable "sns_topic_arn" {
  description = "SNS delivery topic ARN"
}

# -----------------------------------------------------------------------------
# Variables: Lambda
# -----------------------------------------------------------------------------

# var.lambda_role_arn
variable "lambda_role_arn" {
  description = "Lambda role ARN"
}

# var.lambda_filename
variable "lambda_filename" {
  description = "Lambda filename"
}