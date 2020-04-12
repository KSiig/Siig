resource "random_password" "unifi_mongodb_password" {
  length           = 35
  special          = true
  override_special = "@"
}

resource "random_password" "unifi_mongodb_root_password" {
  length           = 35
  special          = true
  override_special = "@"
}
