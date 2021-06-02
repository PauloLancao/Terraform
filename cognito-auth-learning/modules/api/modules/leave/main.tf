# -----------------------------------------------------------------------------
# Data: General
# -----------------------------------------------------------------------------

# data.aws_caller_identity._
data "aws_caller_identity" "_" {}

# -----------------------------------------------------------------------------
# Resources: API Gateway: POST /leave
# -----------------------------------------------------------------------------

# aws_api_gateway_resource._
resource "aws_api_gateway_resource" "_" {
  rest_api_id = var.api_id
  parent_id   = var.api_resource_id
  path_part   = "leave"
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
# Resources: Lambda
# -----------------------------------------------------------------------------

# aws_lambda_function._
resource "aws_lambda_function" "_" {
  function_name = "${var.namespace}-api-leave"
  role          = var.lambda_role_arn
  runtime       = "nodejs12.x"
  filename      = var.lambda_filename
  handler       = "handlers/leave/index.post"
  timeout       = 30
  memory_size   = 512

  source_code_hash = base64sha256(filebase64(var.lambda_filename))

  environment {
    variables = {
      API_BASE_PATH                  = var.api_base_path
      COGNITO_IDENTITY_POOL_PROVIDER = var.cognito_identity_pool_provider
    }
  }
}

# aws_lambda_permission._
resource "aws_lambda_permission" "_" {
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
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