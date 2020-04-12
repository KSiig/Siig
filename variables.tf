variable "globals" {
  type = object({
    env = string
  })
  default = {
    env = "dev"
  }
}

variable "cloudflare_email" {
  description = "Email for Cloudflare account"
}

variable "cloudflare_zone_id" {
  description = "Zone Id for Cloudflare domain"
}

variable "cloudflare_api_key" {
  description = "Api key for Cloudflare account"
}

variable "primary_domain" {
  description = "Main FQDN domain to configure"
}

locals {
  cloudflare_credentials = {
    email   = var.cloudflare_email
    api_key = var.cloudflare_api_key
    zone_id = var.cloudflare_zone_id
  }
}
