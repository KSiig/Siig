output "service_principal_credentials" {
  value = {
    client_id     = azuread_service_principal.sp_terraform_001.application_id
    client_secret = random_password.sp_terraform_001_password_string.result
  }
}
