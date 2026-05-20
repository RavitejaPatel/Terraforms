resource "azurerm_resource_group" "core" {
  name     = "rg-enterprise-architecture"
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.core.name
}
