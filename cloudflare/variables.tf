variable "cloudflare_credentials" {
  type = object({
    email   = string
    api_key = string
    zone_id = string
  })
}

variable "primary_domain" {
  description = "Main FQDN domain to configure"
}

variable "primary_ip" {
  description = "Primary IP to route traffic to"
}
