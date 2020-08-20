data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "kvrg" {
  name     = "${var.kv_resource_group_name}"
  location = var.locations["${var.location}"]
}

resource "azurerm_key_vault" "example" {
  name                        = "${var.prefix}-${var.location}-${var.kvname}"
  location                    = azurerm_resource_group.kvrg.location
  resource_group_name         = azurerm_resource_group.kvrg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = {
    environment = "Testing"
  }
}