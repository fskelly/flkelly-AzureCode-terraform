resource "azurerm_key_vault_secret" "userName" {
  name         = "username"
  value        = var.vm_username
  key_vault_id = var.kvID
}

resource "azurerm_key_vault_secret" "password" {
  name         = "password"
  value        = var.vm_password
  key_vault_id = var.kvID
}