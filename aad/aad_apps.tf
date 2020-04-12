resource "azuread_application" "adapp_terraform_001" {
  name = "adapp-${var.product}-${var.context}-terraform-${var.globals.env}-001"
}
