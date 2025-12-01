output "manufacturing_vnet_name" {
  description = "Name of the Manufacturing VNet"
  value       = azurerm_virtual_network.manufacturing_vnet.name
}

output "manufacturing_vnet_id" {
  description = "ID of the Manufacturing VNet"
  value       = azurerm_virtual_network.manufacturing_vnet.id
}

output "manufacturing_vnet_address_space" {
  description = "Address space of Manufacturing VNet"
  value       = azurerm_virtual_network.manufacturing_vnet.address_space
}

output "manufacturing_subnet_ids" {
  description = "IDs of the Manufacturing subnets"
  value       = { for k, v in azurerm_subnet.manufacturing_subnets : k => v.id }
}

output "manufacturing_subnet_names" {
  description = "Names of the Manufacturing subnets"
  value       = { for k, v in azurerm_subnet.manufacturing_subnets : k => v.name }
}