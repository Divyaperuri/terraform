resource "aws_route53_record" "roboshop" {
  zone_id = "${var.zone_id}"
  count   = 3
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.devopslearn.shop
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip] # Replace with the target IP address
  allow_overwrite   = true
}

