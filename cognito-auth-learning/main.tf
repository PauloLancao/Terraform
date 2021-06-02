# -----------------------------------------------------------------------------
# Modules
# -----------------------------------------------------------------------------

# data.aws_caller_identity._
data "aws_caller_identity" "_" {}

# -----------------------------------------------------------------------------
# Modules
# -----------------------------------------------------------------------------

# module.api
module "api" {
  source = "./modules/api"

  namespace = var.namespace
  region    = var.region

  api_stage = var.api_stage

  cognito_user_pool_id        = module.identity.cognito_user_pool_id
  cognito_user_pool_arn       = module.identity.cognito_user_pool_arn
  cognito_user_pool_client_id = module.identity.cognito_user_pool_client_id

  cognito_identity_pool_provider = var.cognito_identity_pool_provider
}

# module.identity
module "identity" {
  source = "./modules/identity"

  namespace = var.namespace
  region    = var.region

  cognito_identity_pool_name     = var.cognito_identity_pool_name
  cognito_identity_pool_provider = var.cognito_identity_pool_provider
}

# module.message
module "message" {
  source = "./modules/message"

  namespace = var.namespace
  region    = var.region

  cognito_user_pool_id  = module.identity.cognito_user_pool_id
  cognito_user_pool_arn = module.identity.cognito_user_pool_arn

  cognito_identity_pool_name     = var.cognito_identity_pool_name
  cognito_identity_pool_provider = var.cognito_identity_pool_provider

  sns_topic_arn = module.api.sns_topic_arn

  ses_sender_address = var.ses_sender_address
}

# module.route
module "route" {
  source = "./modules/route"

  namespace = var.namespace
  region    = var.region

  app_hosted_zone_id = var.app_hosted_zone_id
  app_domain         = var.app_domain

  /**
  cloudfront_distribution_domain_name = module.web.cloudfront_distribution_domain_name

  cloudfront_distribution_hosted_zone_id = module.web.cloudfront_distribution_hosted_zone_id
  */
}

# module.web
/**
module "web" {
  source = "./modules/web"

  namespace = var.namespace
  region    = var.region

  api_id        = module.api.api_id
  api_stage     = module.api.api_stage
  api_base_path = module.api.api_base_path

  app_hosted_zone_id  = var.app_hosted_zone_id
  app_certificate_arn = var.app_certificate_arn
  app_domain          = var.app_domain
  app_origin          = var.app_origin

  cognito_identity_pool_name = var.cognito_identity_pool_name

  bucket = length(var.bucket) == 0 ? var.namespace : var.bucket
}
*/