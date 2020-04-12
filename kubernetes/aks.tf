resource "azurerm_kubernetes_cluster" "aks_001" {
  name                = "aks-${var.product}-${var.context}-${var.globals.env}-001"
  location            = var.rg_core_001.location
  resource_group_name = var.rg_core_001.name
  dns_prefix          = var.aks_001_dns_prefix
  node_resource_group = "${var.rg_core_001.name}-k8s"

  default_node_pool {
    name       = local.aks_001_default_node_pool_name
    node_count = var.aks_001_default_node_pool_count
    vm_size    = var.aks_001_default_node_pool_vm_size
  }

  service_principal {
    client_id     = var.service_principal_credentials.client_id
    client_secret = var.service_principal_credentials.client_secret
  }

  tags = {
    Environment = title(var.globals.env)
  }
}
