resource "aws_api_gateway_rest_api" "api" {
  name = var.api_name

  endpoint_configuration {
    types = [var.endpoint_type]
  }
}
resource "time_sleep" "wait_30_seconds" {
  depends_on = [aws_api_gateway_rest_api.api]

  create_duration = "30s"
}
resource "aws_api_gateway_deployment" "deploy" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = var.stage_deploy
  lifecycle {
    create_before_destroy = true
  }

  depends_on = [time_sleep.wait_30_seconds]
}
resource "aws_api_gateway_base_path_mapping" "path" {
  api_id      = aws_api_gateway_rest_api.api.id
  stage_name  = aws_api_gateway_deployment.deploy.stage_name
  domain_name = data.aws_api_gateway_domain_name.custom_domain.domain_name
  base_path   = var.path_api
}
# resource "aws_api_gateway_api_key" "api_key" {
#   count = var.create_api_key ? 1 : 0
#   name  = aws_api_gateway_rest_api.api.name
# }
# resource "aws_api_gateway_usage_plan" "plan" {
#   count   = length(aws_api_gateway_api_key.api_key)
#   name    = "Plan-${aws_api_gateway_rest_api.api.name}"

#   api_stages {
#     api_id = aws_api_gateway_rest_api.api.id
#     stage  = aws_api_gateway_deployment.deploy.stage_name
#   }
# }
# resource "aws_api_gateway_usage_plan_key" "plan_key" {
#   count         = length(aws_api_gateway_api_key.api_key)
#   key_id        = aws_api_gateway_api_key.api_key[count.index].id
#   key_type      = "API_KEY"
#   usage_plan_id = aws_api_gateway_usage_plan.plan[count.index].id
# }