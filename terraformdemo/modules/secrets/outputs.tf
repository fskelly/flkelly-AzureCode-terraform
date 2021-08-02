output "userName" {
    value = azurerm_key_vault_secret.userName.value
}

output "userPassword" {
    value = azurerm_key_vault_secret.password.value
}