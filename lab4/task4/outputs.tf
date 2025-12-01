output "public_dns_zone_id" {
  description = "ID of the public DNS zone"
  value       = azurerm_dns_zone.public.id
}

output "public_dns_zone_name" {
  description = "Name of the public DNS zone"
  value       = azurerm_dns_zone.public.name
}

output "public_dns_name_servers" {
  description = "Name servers for the public DNS zone"
  value       = azurerm_dns_zone.public.name_servers
}

output "www_record_fqdn" {
  description = "FQDN of the www A record"
  value       = azurerm_dns_a_record.www.fqdn
}

output "private_dns_zone_id" {
  description = "ID of the private DNS zone"
  value       = azurerm_private_dns_zone.private.id
}

output "private_dns_zone_name" {
  description = "Name of the private DNS zone"
  value       = azurerm_private_dns_zone.private.name
}

output "vnet_link_id" {
  description = "ID of the virtual network link"
  value       = azurerm_private_dns_zone_virtual_network_link.manufacturing_link.id
}

output "sensorvm_record_fqdn" {
  description = "FQDN of the sensorvm A record"
  value       = azurerm_private_dns_a_record.sensorvm.fqdn
}