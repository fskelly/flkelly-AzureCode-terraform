resource "azurerm_kubernetes_cluster" "aks" {
  dns_prefix          = local.aks_cluster_name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  location            = azurerm_resource_group.primary.location
  name                = local.aks_cluster_name
  resource_group_name = azurerm_resource_group.primary.name

  default_node_pool {
    name                 = "system"
    node_count           = 1
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    vm_size              = "Standard_DS2_v2"
  }

  identity { type = "SystemAssigned" }
}