data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

resource "azurerm_managed_disk" "disk2" {
  name                 = var.disk_name
  location             = data.azurerm_resource_group.existing.location
  resource_group_name  = data.azurerm_resource_group.existing.name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb

  tags = {
    environment = "lab"
    task        = "task2"
  }
}