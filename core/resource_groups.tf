resource "azurerm_resource_group" "rg_001" {
  name     = "rg-${var.product}-${var.context}-${var.globals.env}-001"
  location = var.az_primary_location
}
