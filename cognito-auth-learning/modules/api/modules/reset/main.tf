# -----------------------------------------------------------------------------
# Data: General
# -----------------------------------------------------------------------------

# data.aws_caller_identity._
data "aws_caller_identity" "_" {}

# -----------------------------------------------------------------------------
# Resources: API Gateway: POST /reset
# -----------------------------------------------------------------------------

# aws_api_gateway_resource._
resource "aws_api_gateway_resource" "_" {
  rest_api_id = var.api_id
  parent_id   = var.api_resource_id
  path_part   = "reset"
}

# aws_api_gateway_method._
resource "aws_api_gateway_method" "_" {
  rest_api_id   = var.api_id
  resource_id   = aws_api_gateway_resource._.id
  http_method   = "POST"
  authorization = "NONE"
}

# aws_api_gateway_integration._
resource "aws_api_gateway_integration" "_" {
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource._.id
  http_method = aws_api_gateway_method._.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"

  uri = "arn:aws:apigateway:${
    var.region
    }:lambda:path/2015-03-31/functions/${
    aws_lambda_function._.arn
  }/invocations"
}

# -----------------------------------------------------------------------------
# Resources: API Gateway: POST /reset/{code}
# -----------------------------------------------------------------------------

# aws_api_gateway_resource.verify
resource "aws_api_gateway_resource" "verify" {
  rest_api_id = var.api_id
  parent_id   = aws_api_gateway_resource._.id
  path_part   = "{code}"
}

# aws_api_gateway_method.verify
resource "aws_api_gateway_method" "verify" {
  rest_api_id   = var.api_id
  resource_id   = aws_api_gateway_resource.verify.id
  http_method   = "POST"
  authorization = "NONE"
}

# aws_api_gateway_integration.verify
resource "aws_api_gateway_integration" "verify" {
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource.verify.id
  http_method = aws_api_gateway_method.verify.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"

  uri = "arn:aws:apigateway:${
    var.region
    }:lambda:path/2015-03-31/functions/${
    aws_lambda_function.verify.arn
  }/invocations"
}

# -----------------------------------------------------------------------------
# Resources: Lambda
# -----------------------------------------------------------------------------

# aws_lambda_function._
resource "aws_lambda_function" "_" {
  function_name = "${var.namespace}-api-reset"
  role          = var.lambda_role_arn
  runtime       = "nodejs12.x"
  filename      = var.lambda_filename
  handler       = "handlers/reset/index.post"
  timeout       = 30
  memory_size   = 512

  source_code_hash = base64sha256(filebase64(var.lambda_filename))

  environment {
    variables = {
      COGNITO_USER_POOL_ID        = var.cognito_user_pool_id
      COGNITO_USER_POOL_CLIENT_ID = var.cognito_user_pool_client_id
      DYNAMODB_TABLE              = var.dynamodb_table
      SNS_TOPIC_ARN               = var.sns_topic_arn
    }
  }
}

# aws_lambda_permission._
resource "aws_lambda_permission" "_" {
  principal     = "apigateway.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function._.arn

  source_arn = "arn:aws:execute-api:${
    var.region
    }:${
    data.aws_caller_identity._.account_id
    }:${
    var.api_id
    }/*/${
    aws_api_gateway_method._.http_method
    }${
    aws_api_gateway_resource._.path
  }"
}

# -----------------------------------------------------------------------------

# aws_lambda_function.verify
resource "aws_lambda_function" "verify" {
  function_name = "${var.namespace}-api-reset-verify"
  role          = var.lambda_role_arn
  runtime       = "nodejs12.x"
  filename      = var.lambda_filename
  handler       = "handlers/reset/verify.post"
  timeout       = 30
  memory_size   = 512

  source_code_hash = base64sha256(filebase64(var.lambda_filename))

  environment {
    variables = {
      COGNITO_USER_POOL_ID        = var.cognito_user_pool_id
      COGNITO_USER_POOL_CLIENT_ID = var.cognito_user_pool_client_id
      DYNAMODB_TABLE              = var.dynamodb_table
      SNS_TOPIC_ARN               = var.sns_topic_arn
    }
  }
}

# aws_lambda_permission.verify
resource "aws_lambda_permission" "verify" {
  principal     = "apigateway.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.verify.arn

  source_arn = "arn:aws:execute-api:${
    var.region
    }:${
    data.aws_caller_identity._.account_id
    }:${
    var.api_id
    }/*/${
    aws_api_gateway_method.verify.http_method
    }${
    aws_api_gateway_resource.verify.path
  }"
}