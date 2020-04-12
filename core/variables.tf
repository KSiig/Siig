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

variable "az_primary_location" {
  description = "Primary region to place resources in"
  default     = "West Europe"
}

# Overrides
variable "resource_group_name" {
  description = "Resource group to place resources in"
  default     = ""
}

// azurerm_storage_account.st_001
variable "st_001_account_tier" {
  description = "Account tier for primary storage account"
  default     = "Standard"
}

variable "st_001_account_replication_type" {
  description = "Account replication type for primary storage account"
  default     = "LRS"
}

variable "st_001_tfstate_container_access_type" {
  description = "Container Access Type for tfstate container"
  default     = "private"
}

# Overrides
variable "st_001_tfstate_name" {
  description = "Name of Storage Container containing tfstate"
  default     = ""
}

locals {
  resource_group_name = "${var.resource_group_name != "" ? var.resource_group_name : "rg-${var.product}-${var.context}-${var.globals.env}-001"}"
  st_001_tfstate_name = "${var.st_001_tfstate_name != "" ? var.st_001_tfstate_name : "stc-${var.product}-${var.context}-tfstate-${var.globals.env}-001"}"
}
