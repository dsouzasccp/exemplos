data "aws_api_gateway_domain_name" "custom_domain" {
  domain_name = "api.${var.env}.${var.domain}"
}