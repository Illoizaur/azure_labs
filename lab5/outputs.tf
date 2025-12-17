output "CoreServicesVM_Private_IP" {
  value = azurerm_network_interface.core_nic.private_ip_address
}

output "ManufacturingVM_Private_IP" {
  value = azurerm_network_interface.mfg_nic.private_ip_address
}