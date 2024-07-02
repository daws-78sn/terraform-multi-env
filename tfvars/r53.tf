resource "aws_route53_record" "expense" {
    for_each = aws_instance.expense
    zone_id = var.zone.id
    name = each.key == "frontend-prod" ? var.domain_name : "${each.key}.${var.domain_name}" #name = local.record_name#count and count.index will not work in locals
    type = "A"
    ttl = 1
    records = startswith(each.key, "frontend") ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true # it will overwrite existing records
}