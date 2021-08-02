output "frontendSubnetID" {
  value = azurerm_subnet.frontend.id
}
output "backendSubnetID" {
  value = azurerm_subnet.backend.id
}
output "databaseSubnetID" {
  value = azurerm_subnet.database.id
}