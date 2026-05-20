resource "azurerm_virtual_network" "enterprise_backbone" {
  name                = "vnet-enterprise-core"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  address_space       = var.vnet_address_space
}
