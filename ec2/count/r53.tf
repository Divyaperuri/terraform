resource "aws_route53_record" "roboshop" {
  zone_id = var.zone_id
  name    = "www.example.com" #mongodb.devopslearn.shop
  type    = "A"
  ttl     = 300
  records = ["192.0.2.1"] # Replace with the target IP address
}