# TOVA.SH

resource "aws_route53_zone" "tova_sh" {
  name = "tova.sh"
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

# blog.tova.sh

resource "aws_route53_record" "blog_tova_sh_cf" {
  zone_id = aws_route53_zone.tova_sh.zone_id
  name    = "blog.tova.sh"
  type    = "A"
  
  alias {
    name                   = "d2zsdcthdmlgt3.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}


# RONIN.BA

resource "aws_route53_zone" "ronin_ba" {
  name = "ronin.ba"
}

resource "aws_route53_record" "ronin_ba_soa" {
  zone_id = aws_route53_zone.ronin_ba.zone_id
  name    = "ronin.ba"
  type    = "SOA"
  ttl     = "900"
  records = ["ns-488.awsdns-61.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
}

resource "aws_route53_record" "ronin_ba_ns" {
  zone_id = aws_route53_zone.ronin_ba.zone_id
  name    = "ronin.ba"
  type    = "NS"
  ttl     = "172800"
  records = aws_route53_zone.ronin_ba.name_servers
}

resource "aws_route53_record" "ronin_ba_mx" {
  zone_id = aws_route53_zone.ronin_ba.zone_id
  name    = "ronin.ba"
  type    = "MX"
  ttl     = "300"
  records = ["10 mx.zoho.eu", "20 mx2.zoho.eu", "50 mx3.zoho.eu"]
}

resource "aws_route53_record" "ronin_ba_txt" {
  zone_id = aws_route53_zone.ronin_ba.zone_id
  name    = "ronin.ba"
  type    = "TXT"
  ttl     = "300"
  records = ["zoho-verification=zb98628202.zmverify.zoho.eu", "v=spf1 include:zoho.eu ~all"]
}

resource "aws_route53_record" "ronin_ba_txt_email_sig" {
  zone_id = aws_route53_zone.ronin_ba.zone_id
  name    = "zmail._domainkey.ronin.ba"
  type    = "TXT"
  ttl     = "300"
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCs84yWQQoyjUzcEq6B97ZTezgMgLpoI37ccgRESJvrM1rlMjHU3iprKtBBZhAkGqeIO4Z/jL0n2K/eit+mYwFaJ2Ri7u/6KNSIzui6y1oBCzS64je3hqTA223gs+jo6GbXx30uOxUU1JqRrxW5jD5uZfOqyUM91lVno1u8rghgJQIDAQAB"]
}

resource "aws_route53_record" "ronin_ba_cf" {
  zone_id = aws_route53_zone.ronin_ba.zone_id
  name    = "ronin.ba"
  type    = "A"
  
  alias {
    name                   = "d2uh5t7votprml.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}
