provider "helm" {
  version = "1.1.1"
}

provider "random" {
  version = "2.2.1"
}

provider "kubernetes" {
  load_config_file       = var.kubernetes_credentials.load_config_file
  host                   = var.kubernetes_credentials.host
  username               = var.kubernetes_credentials.username
  password               = var.kubernetes_credentials.password
  client_certificate     = var.kubernetes_credentials.client_certificate
  client_key             = var.kubernetes_credentials.client_key
  cluster_ca_certificate = var.kubernetes_credentials.cluster_ca_certificate
}
