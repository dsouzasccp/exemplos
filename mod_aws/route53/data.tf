# data "aws_acm_certificate" "certificate" {
#   domain   = "*.${var.env}.${var.domain}"
#   statuses = ["ISSUED"]
# }
data "aws_route53_zone" "selected" {
  name         = "${var.env}.${var.domain}"
}