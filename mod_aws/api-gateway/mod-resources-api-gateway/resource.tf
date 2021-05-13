resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.api_id
  parent_id   = var.api-gateway_root_id
  path_part   = var.resource_name
}

resource "aws_api_gateway_resource" "resource_2" {
  count       = var.create_path_2 ? 1 : 0
  rest_api_id = var.api_id
  parent_id   = var.create_path_2 ? aws_api_gateway_resource.resource.id : null
  path_part   = var.resource_path2
}

resource "aws_api_gateway_resource" "resource_3" {
  count       = var.create_path_3 ? 1 : 0
  rest_api_id = var.api_id
  parent_id   = var.create_path_3 ? aws_api_gateway_resource.resource_2[count.index].id : null
  path_part   = var.resource_path3
}

resource "aws_api_gateway_resource" "proxy" {
  count       = 1
  rest_api_id = var.api_id
  parent_id   = var.create_path_3 ? aws_api_gateway_resource.resource_3[count.index].id : var.create_path_2 ? aws_api_gateway_resource.resource_2[count.index].id : aws_api_gateway_resource.resource.id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "method" {
  count               = 1
  rest_api_id         = var.api_id
  resource_id         = aws_api_gateway_resource.proxy[count.index].id
  http_method         = "ANY"
  authorization       = "NONE"
  # authorizer_id       = var.authorizer_id
  api_key_required    = var.enable_api_key
  request_parameters  = {
    "method.request.path.proxy" = true
  }
}

resource "aws_api_gateway_integration" "integration" {
  count                   = 1
  depends_on              = [aws_api_gateway_method.method]
  rest_api_id             = var.api_id
  resource_id             = aws_api_gateway_resource.proxy[count.index].id
  http_method             = "ANY"
  integration_http_method = "ANY"
  type                    = "HTTP_PROXY"
  passthrough_behavior    = "WHEN_NO_MATCH"
  uri                     = var.endpoint
  connection_type         = "VPC_LINK"
  connection_id           = var.vpclink_id
  request_parameters = {
    "integration.request.path.proxy" = "method.request.path.proxy"
  }
}

resource "aws_api_gateway_method" "options_method" {
  count         = 1
  rest_api_id   = var.api_id
  resource_id   = aws_api_gateway_resource.proxy[count.index].id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "options_200" {
  count           = 1
  rest_api_id     = var.api_id
  resource_id     = aws_api_gateway_resource.proxy[count.index].id
  http_method     = aws_api_gateway_method.options_method[count.index].http_method
  status_code     = 200
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false
    "method.response.header.Access-Control-Allow-Methods" = false
    "method.response.header.Access-Control-Allow-Origin"  = false
  }
  depends_on = [aws_api_gateway_method.options_method]
}

resource "aws_api_gateway_integration" "options_integration" {
  count       = 1
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource.proxy[count.index].id
  http_method = aws_api_gateway_method.options_method[count.index].http_method
  type        = "MOCK"
  request_templates = {
    "application/json" = "{'statusCode':200}"
  }
  depends_on = [aws_api_gateway_method.options_method]
}

resource "aws_api_gateway_integration_response" "options_integration_response" {
  count       = 1
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource.proxy[count.index].id
  http_method = aws_api_gateway_method.options_method[count.index].http_method
  status_code = 200

  response_templates = {
    "application/json" = "{statusCode:200}"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,Token,X-Auth-User,X-Auth-Token'"
    "method.response.header.Access-Control-Allow-Methods" = "'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT'"
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }
  depends_on = [aws_api_gateway_method_response.options_200]
}