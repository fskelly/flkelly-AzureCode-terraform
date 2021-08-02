resource "azurerm_resource_group" "rg" {
  //name     = "${var.prefix}-${var.purpose}-${var.location}-rg"
  name     = var.rgName
  location = var.rgLocation
}