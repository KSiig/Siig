provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_credentials.email
  api_key = var.cloudflare_credentials.api_key
}
