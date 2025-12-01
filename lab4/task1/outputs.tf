output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "ID of the resource group"
  value       = azurerm_resource_group.rg.id
}

output "core_vnet_name" {
  description = "Name of the Core Services VNet"
  value       = azurerm_virtual_network.core_vnet.name
}

output "core_vnet_id" {
  description = "ID of the Core Services VNet"
  value       = azurerm_virtual_network.core_vnet.id
}

output "core_vnet_address_space" {
  description = "Address space of Core Services VNet"
  value       = azurerm_virtual_network.core_vnet.address_space
}

output "subnet_ids" {
  description = "IDs of the subnets"
  value       = { for k, v in azurerm_subnet.core_subnets : k => v.id }
}

output "subnet_names" {
  description = "Names of the subnets"
  value       = { for k, v in azurerm_subnet.core_subnets : k => v.name }
}