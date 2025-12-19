output "vm1_id" { value = azurerm_windows_virtual_machine.vms[0].id }
output "vmss_id" { value = azurerm_windows_virtual_machine_scale_set.vmss.id }