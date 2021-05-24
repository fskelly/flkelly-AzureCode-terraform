resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
    location = var.resource_group_location

    tags = {
        environment = "staging"
        createdBY = "Terraform"
        canBeDeleted = "yes"
    }
}

