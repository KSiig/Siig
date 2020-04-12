resource "azuread_service_principal" "sp_terraform_001" {
  application_id               = azuread_application.adapp_terraform_001.application_id
  app_role_assignment_required = false
}

resource "azuread_application_password" "sp_terraform_001_password" {
  application_object_id = azuread_application.adapp_terraform_001.object_id
  value                 = random_password.sp_terraform_001_password_string.result
  end_date_relative     = "8760h" # 365 days
}
