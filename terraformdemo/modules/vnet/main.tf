resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnetPrefix}-network"
  resource_group_name = var.vnetRGName
  location            = var.vnetLocation
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.vnetRGName
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.vnetRGName
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "database" {
  name                 = "database"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.vnetRGName
  address_prefixes     = ["10.0.3.0/24"]
}