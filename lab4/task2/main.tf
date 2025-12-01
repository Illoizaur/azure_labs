data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "manufacturing_vnet" {
  name                = var.manufacturing_vnet_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  address_space       = var.manufacturing_vnet_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "manufacturing_subnets" {
  for_each = var.manufacturing_subnets

  name                 = each.value.name
  resource_group_name  = data.azurerm_resource_group.existing.name
  virtual_network_name = azurerm_virtual_network.manufacturing_vnet.name
  address_prefixes     = each.value.address_prefixes
}