// Modules
module "core" {
  source  = "./core"
  product = "siig"
  globals = var.globals
}

module "aad" {
  source      = "./aad"
  product     = "siig"
  globals     = var.globals
  rg_core_001 = module.core.rg_core_001
}

module "kubernetes" {
  source                        = "./kubernetes"
  product                       = "siig"
  globals                       = var.globals
  rg_core_001                   = module.core.rg_core_001
  service_principal_credentials = module.aad.service_principal_credentials
}

module "cloudflare" {
  source                 = "./cloudflare"
  cloudflare_credentials = local.cloudflare_credentials
  primary_domain         = var.primary_domain
  primary_ip             = module.kubernetes.nginx_ingress_ip
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-siig-core-prod-001"
    storage_account_name = "stsiigcoreprod001"
    container_name       = "stc-siig-core-tfstate-prod-001"
    key                  = "terraform.tfstate"
  }
}
