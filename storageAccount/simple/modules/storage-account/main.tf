resource "random_id" "storage_account" {
  byte_length = 8
}

resource "azurerm_storage_account" "sa" {
  name                      = "${var.storage_account_prefix}${lower(random_id.storage_account.hex)}"
  resource_group_name       = var.storage_account_resource_group_name
  location                  = var.storage_account_resource_group_location
  account_tier              = var.storage_account_sku
  account_replication_type  = var.storage_account_replication

  tags = {
    environment = "staging"
    createdBY = "Terraform"
    canBeDeleted = "yes"
  }
}