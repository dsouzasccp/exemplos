resource "aws_api_gateway_api_key" "api_key" {
  name  = var.api_key_name
  value = var.api_key_value
}
resource "aws_api_gateway_usage_plan" "plan" {
  # count   = length(aws_api_gateway_api_key.api_key)
  name    = "Plan_${var.api_key_name}"

  api_stages {
    api_id = var.api_id
    stage  = var.stage_name
  }
}
resource "aws_api_gateway_usage_plan_key" "plan_key" {
  # count         = length(aws_api_gateway_api_key.api_key)
  key_id        = aws_api_gateway_api_key.api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.plan.id
}