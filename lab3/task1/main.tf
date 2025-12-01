resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_managed_disk" "disk1" {
  name                 = var.disk_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb

  tags = {
    environment = "lab"
    task        = "task1"
  }
}