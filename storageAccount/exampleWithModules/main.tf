resource "random_id" "storage_account" {
  byte_length = 8
}

module "resource_group" {
    source = "./modules/resource-group"
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
}

module "storage_account" {
  source = "./modules/storage-account"
  storage_account_sku = var.storage_account_sku
  storage_account_replication = var.storage_account_replication
  storage_account_resource_group_name = module.resource_group.resource_group_name
  storage_account_resource_group_location = module.resource_group.resource_group_location
  storage_account_prefix = var.storage_account_prefix
}

/* resource "azurerm_storage_account" "example" {
  name                     = "${var.prefix}${lower(random_id.storage_account.hex)}"
  resource_group_name      = module.resource_group.resource_group_name
  location                 = module.resource_group.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
} */