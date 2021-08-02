provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.kvName
  location                    = var.kvRGLocation
  resource_group_name         = var.kvRGName
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create", "get", "list",
    ]

    secret_permissions = [
      "set", "get", "delete", "purge", "recover", "list"
    ]
    storage_permissions = [
      "Get", "List", //"List","Update","Create","Import","Delete","Recover","Backup","Restore",
    ]
  }
}