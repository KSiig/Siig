// Providers
provider "azurerm" {
  version = "2.1.0"
  features {}
}

provider "kubernetes" {
  load_config_file       = local.kubernetes_credentials.load_config_file
  host                   = local.kubernetes_credentials.host
  username               = local.kubernetes_credentials.username
  password               = local.kubernetes_credentials.password
  client_certificate     = local.kubernetes_credentials.client_certificate
  client_key             = local.kubernetes_credentials.client_key
  cluster_ca_certificate = local.kubernetes_credentials.cluster_ca_certificate
}

module "ingress" {
  source                  = "./ingress"
  nginx_ingress_namespace = kubernetes_namespace.ns_ingress.metadata[0].name
}

module "unifi" {
  source                 = "./unifi"
  unifi_namespace        = kubernetes_namespace.ns_unifi.metadata[0].name
  kubernetes_credentials = local.kubernetes_credentials
}

module "linkerd" {
  source = "./linkerd"
}

locals {
  kubernetes_credentials = {
    load_config_file       = "false"
    host                   = azurerm_kubernetes_cluster.aks_001.kube_config.0.host
    username               = azurerm_kubernetes_cluster.aks_001.kube_config.0.username
    password               = azurerm_kubernetes_cluster.aks_001.kube_config.0.password
    client_certificate     = base64decode(azurerm_kubernetes_cluster.aks_001.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.aks_001.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks_001.kube_config.0.cluster_ca_certificate)
  }
}
