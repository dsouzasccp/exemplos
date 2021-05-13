resource "aws_api_gateway_resource" "resource_main" {
  count       = var.num_resource
  rest_api_id = var.api_id
  parent_id   = var.api_gateway_root_id
  path_part   = element(var.resource_name, count.index)
}
