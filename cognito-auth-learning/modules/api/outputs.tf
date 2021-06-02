# -----------------------------------------------------------------------------
# Outputs: API Gateway
# -----------------------------------------------------------------------------

# output.api_id
output "api_id" {
  value = aws_api_gateway_rest_api._.id
}

# output.api_stage
output "api_stage" {
  value = aws_api_gateway_stage._.stage_name
}

# output.api_invoke_url
output "api_invoke_url" {
  value = aws_api_gateway_stage._.invoke_url
}

# output.api_base_path
output "api_base_path" {
  value = aws_api_gateway_resource._.path_part
}

# -----------------------------------------------------------------------------
# Outputs: DynamoDB
# -----------------------------------------------------------------------------

# output.dynamodb_table
output "dynamodb_table" {
  value = aws_dynamodb_table._.name
}

# -----------------------------------------------------------------------------
# Outputs: SNS
# -----------------------------------------------------------------------------

# output.sns_topic_arn
output "sns_topic_arn" {
  value = aws_sns_topic._.arn
}