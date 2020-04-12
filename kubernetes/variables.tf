variable "globals" {
  type = object({
    env = string
  })
  default = {
    env = "dev"
  }
}

// Default
variable "context" {
  description = "What context resources should live in"
  default     = "core"
}

variable "product" {
  description = "What product the resources belong to"
}

variable "rg_core_001" {
  description = "Primary resource group"
}

// AKS
variable "aks_001_dns_prefix" {
  description = "DNS prefix for primary AKS cluster"
  default     = "siig"
}

variable "aks_001_default_node_pool_name" {
  description = "Node pool name for primary AKS cluster"
  default     = ""
}

variable "aks_001_default_node_pool_count" {
  description = "Node count for primary AKS cluster"
  default     = "1"
}

variable "aks_001_default_node_pool_vm_size" {
  description = "Node VM size for primary AKS cluster"
  default     = "Standard_D2_v3"
}

variable "service_principal_credentials" {
  description = "Service Principal Credentials"
  type = object({
    client_id     = string
    client_secret = string
  })
}


locals {
  aks_001_default_node_pool_name = "${var.aks_001_default_node_pool_name != "" ? var.aks_001_default_node_pool_name : "np${substr(var.product, 0, 1)}${substr(var.context, 0, 1)}001"}"
}
