resource "cloudflare_record" "main" {
  zone_id = var.cloudflare_credentials.zone_id
  name    = var.primary_domain
  value   = var.primary_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "main_wildcard" {
  zone_id = var.cloudflare_credentials.zone_id
  name    = "*"
  value   = var.primary_ip
  type    = "A"
}
