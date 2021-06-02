# -----------------------------------------------------------------------------
# Providers
# -----------------------------------------------------------------------------

# output.aws_account_id
output "aws_account_id" {
  value = data.aws_caller_identity._.account_id
}

# output.aws_region
output "aws_region" {
  value = var.region
}

# -----------------------------------------------------------------------------
# Outputs: API Gateway
# -----------------------------------------------------------------------------

# output.api_id
output "api_id" {
  value = module.api.api_id
}

# output.api_stage
output "api_stage" {
  value = module.api.api_stage
}

# output.api_invoke_url
output "api_invoke_url" {
  value = module.api.api_invoke_url
}

# output.api_base_path
output "api_base_path" {
  value = module.api.api_base_path
}

# -----------------------------------------------------------------------------
# Variables: Application
# -----------------------------------------------------------------------------

# output.app_hosted_zone_id
output "app_hosted_zone_id" {
  value = var.app_hosted_zone_id
}

# output.app_certificate_arn
output "app_certificate_arn" {
  value = var.app_certificate_arn
}

# output.app_domain
output "app_domain" {
  value = var.app_domain
}

# output.app_origin
output "app_origin" {
  value = var.app_origin
}

# -----------------------------------------------------------------------------
# Outputs: Cognito
# -----------------------------------------------------------------------------

# output.cognito_user_pool_id
output "cognito_user_pool_id" {
  value = module.identity.cognito_user_pool_id
}

# output.cognito_user_pool_arn
output "cognito_user_pool_arn" {
  value = module.identity.cognito_user_pool_arn
}

# output.cognito_user_pool_client_id
output "cognito_user_pool_client_id" {
  value = module.identity.cognito_user_pool_client_id
}

# output.cognito_identity_pool_id
output "cognito_identity_pool_id" {
  value = module.identity.cognito_identity_pool_id
}

# output.cognito_identity_pool_name
output "cognito_identity_pool_name" {
  value = var.cognito_identity_pool_name
}

# output.cognito_identity_pool_provider
output "cognito_identity_pool_provider" {
  value = var.cognito_identity_pool_provider
}

# -----------------------------------------------------------------------------
# Outputs: DynamoDB
# -----------------------------------------------------------------------------

# output.dynamodb_table
output "dynamodb_table" {
  value = module.api.dynamodb_table
}

# -----------------------------------------------------------------------------
# Outputs: SNS
# -----------------------------------------------------------------------------

# output.sns_topic_arn
output "sns_topic_arn" {
  value = module.api.sns_topic_arn
}

# -----------------------------------------------------------------------------
# Outputs: SES
# -----------------------------------------------------------------------------

# output.ses_sender_address
output "ses_sender_address" {
  value = var.ses_sender_address
}