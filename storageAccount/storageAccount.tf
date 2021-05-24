module "resourceGroup" {
    source = "./modules/resourceGroup"
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
}

resource "azurerm_storage_account" "storageAccount" {
  name                     = "${var.prefix}${var.purpose}${var.resource_group_location}sa"
  resource_group_name      = module.resourceGroup.resource_group_name
  location                 = module.resourceGroup.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}