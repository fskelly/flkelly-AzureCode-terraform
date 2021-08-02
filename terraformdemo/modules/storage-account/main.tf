resource "azurerm_storage_account" "sa" {
  name                     = var.saName
  resource_group_name      = var.saRGNname
  location                 = var.saLocation
  account_tier             = "Standard"
  account_replication_type = var.saReplicationType

}