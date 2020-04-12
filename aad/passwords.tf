resource "random_password" "sp_terraform_001_password_string" {
  length  = 35
  special = true
}
