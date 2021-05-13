output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}

output "api_name" {
  value = aws_api_gateway_rest_api.api.name
}

output "api_root_id" {
  value = aws_api_gateway_rest_api.api.root_resource_id
}

output "stage_deploy" {
  value = aws_api_gateway_deployment.deploy.stage_name
}

# output "authorizer_id" {
#   value = aws_api_gateway_authorizer.authorizer.id
# }


