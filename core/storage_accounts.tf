resource "azurerm_storage_account" "st_001" {
  name                     = "st${var.product}${var.context}${var.globals.env}001"
  resource_group_name      = local.resource_group_name
  location                 = azurerm_resource_group.rg_001.location
  account_tier             = var.st_001_account_tier
  account_replication_type = var.st_001_account_replication_type

  tags = {
    Environment = title(var.globals.env)
  }
}

resource "azurerm_storage_container" "st_001_tfstate" {
  name                  = local.st_001_tfstate_name
  storage_account_name  = azurerm_storage_account.st_001.name
  container_access_type = var.st_001_tfstate_container_access_type
}
