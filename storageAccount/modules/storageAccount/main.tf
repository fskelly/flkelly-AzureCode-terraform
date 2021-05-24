resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.prefix}${var.purpose}${var.resource_group_location}sa"
  resource_group_name      = module.resourceGroup.resource_group_name
  location                 = module.resourceGroup.resource_group_location
  account_tier             = var.storage_account_account_kind
  replication_type         = var.storage_account_replication_type

}