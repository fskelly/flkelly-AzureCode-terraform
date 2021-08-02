resource "azurerm_public_ip" "pip1" {
  name                = var.pipName
  resource_group_name = var.pipRGName
  location = var.pipRGLocation
  allocation_method   = "Static"

  tags = {
    environment = "Dev"
  }
}