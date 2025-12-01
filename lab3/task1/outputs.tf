output "disk_id" {
  value = azurerm_managed_disk.disk1.id
}

output "disk_name" {
  value = azurerm_managed_disk.disk1.name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}