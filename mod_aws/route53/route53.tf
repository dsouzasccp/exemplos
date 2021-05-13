resource "aws_route53_record" "dns" {
  allow_overwrite = true
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.name}.${data.aws_route53_zone.selected.name}"
  type    = var.type
  ttl     = "300"
  records = var.record
}
