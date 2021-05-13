output "resource_main_id" {
    value = aws_api_gateway_resource.resource_main.*.id
}
