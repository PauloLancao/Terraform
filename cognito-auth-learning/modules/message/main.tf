# -----------------------------------------------------------------------------
# Local variables
# -----------------------------------------------------------------------------

# local.*
locals {
  enabled = length(var.ses_sender_address) == 0 ? 0 : 1
}

# -----------------------------------------------------------------------------
# Data: IAM
# -----------------------------------------------------------------------------

# data.template_file.lambda_iam_policy.rendered
data "template_file" "lambda_iam_policy" {
  count    = local.enabled
  template = file("${path.module}/iam/policies/lambda.json")

  vars = {
    cognito_user_pool_arn = var.cognito_user_pool_arn
  }
}

# -----------------------------------------------------------------------------
# Resources: IAM
# -----------------------------------------------------------------------------

# aws_iam_role.lambda
resource "aws_iam_role" "lambda" {
  count = local.enabled
  name  = "${var.namespace}-message-lambda"

  assume_role_policy = file("${path.module}/iam/policies/assume-role/lambda.json")
}

# aws_iam_policy.lambda
resource "aws_iam_policy" "lambda" {
  count = local.enabled
  name  = "${var.namespace}-message-lambda"

  policy = data.template_file.lambda_iam_policy[0].rendered
}

# aws_iam_policy_attachment.lambda
resource "aws_iam_policy_attachment" "lambda" {
  count = local.enabled
  name  = "${var.namespace}-message-lambda"

  policy_arn = aws_iam_policy.lambda[0].arn
  roles      = [aws_iam_role.lambda[0].name]
}

# -----------------------------------------------------------------------------
# Resources: SNS
# -----------------------------------------------------------------------------

# aws_sns_topic_subscription._
resource "aws_sns_topic_subscription" "_" {
  count     = local.enabled
  topic_arn = var.sns_topic_arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function._[0].arn
}

# -----------------------------------------------------------------------------
# Resources: Lambda
# -----------------------------------------------------------------------------

# aws_lambda_function._
resource "aws_lambda_function" "_" {
  count         = local.enabled
  function_name = "${var.namespace}-message"
  role          = aws_iam_role.lambda[0].arn
  runtime       = "nodejs12.x"
  filename      = "${path.module}/lambda/dist.zip"
  handler       = "index.handler"
  timeout       = 10

  source_code_hash = base64sha256(filebase64("${path.module}/lambda/dist.zip"))

  environment {
    variables = {
      COGNITO_USER_POOL_ID           = var.cognito_user_pool_id
      COGNITO_IDENTITY_POOL_NAME     = var.cognito_identity_pool_name
      COGNITO_IDENTITY_POOL_PROVIDER = var.cognito_identity_pool_provider
      SES_SENDER_ADDRESS             = var.ses_sender_address
    }
  }
}

# aws_lambda_permission._
resource "aws_lambda_permission" "_" {
  count         = local.enabled
  principal     = "sns.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function._[0].arn
  source_arn    = var.sns_topic_arn
}