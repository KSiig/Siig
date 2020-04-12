resource "azurerm_role_assignment" "sp_terraform_001_rg_001" {
  scope                = var.rg_core_001.id
  role_definition_name = var.sp_terraform_001_rg_core_001_role
  principal_id         = azuread_service_principal.sp_terraform_001.object_id
}
