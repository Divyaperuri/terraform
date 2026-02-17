resource "aws_route53_record" "roboshop" {
  zone_id = "${var.zone_id}"
  for_each  = aws_instance.terraform
  name    = "${each.key}.${var.domain_name}" #mongodb.devopslearn.shop
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip] # Replace with the target IP address
  allow_overwrite   = true
}