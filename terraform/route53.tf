# TOVA.SH

resource "aws_route53_zone" "tova_sh" {
  name = "tova.sh"
}

resource "aws_route53_zone" "infra_tova_sh" {
  name = "infra.tova.sh"
}

resource "aws_route53_record" "tova_sh_soa" {
  zone_id = aws_route53_zone.tova_sh.zone_id
  name    = "tova.sh"
  type    = "SOA"
  ttl     = "900"
  records = ["ns-1755.awsdns-27.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
}

resource "aws_route53_record" "tova_sh_ns" {
  zone_id = aws_route53_zone.tova_sh.zone_id
  name    = "tova.sh"
  type    = "NS"
  ttl     = "172800"
  records = aws_route53_zone.tova_sh.name_servers
}

resource "aws_route53_record" "tova_sh_mx" {
  zone_id = aws_route53_zone.tova_sh.zone_id
  name    = "tova.sh"
  type    = "MX"
  ttl     = "300"
  records = ["5 mx01.mail.icloud.com.", "10 mx02.mail.icloud.com."]
}

resource "aws_route53_record" "tova_sh_txt" {
  zone_id = aws_route53_zone.tova_sh.zone_id
  name    = "tova.sh"
  type    = "TXT"
  ttl     = "300"
  records = ["apple-domain=YrlWVV6EevznSLJA", "v=spf1 redirect=icloud.com"]
}

resource "aws_route53_record" "ios_mail_sig" {
  zone_id = aws_route53_zone.tova_sh.zone_id
  name    = "sig1._domainkey.tova.sh."
  type    = "CNAME"
  ttl     = "300"
  records = ["sig1.dkim.tova.sh.at.icloudmailadmin.com."]
}

resource "aws_route53_record" "tova_sh_ns_infra" {
  zone_id = aws_route53_zone.tova_sh.zone_id
  name    = "infra.tova.sh"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.infra_tova_sh.name_servers
}

resource "aws_route53_record" "infra_tova_sh_ns" {
  zone_id = aws_route53_zone.infra_tova_sh.zone_id
  name    = "infra.tova.sh"
  type    = "NS"
  ttl     = "172800"
  records = aws_route53_zone.infra_tova_sh.name_servers
}

resource "aws_route53_record" "infra_tova_sh_soa" {
  zone_id = aws_route53_zone.infra_tova_sh.zone_id
  name    = "infra.tova.sh"
  type    = "SOA"
  ttl     = "900"
  records = ["ns-527.awsdns-01.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
}

# RONIN.BA

resource "aws_route53_zone" "ronin_ba" {
  name = "ronin.ba"
}