data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "manufacturing_vnet" {
  name                = var.manufacturing_vnet_name
  resource_group_name = var.resource_group_name
}

# Public DNS Zone
resource "azurerm_dns_zone" "public" {
  name                = var.public_dns_zone_name
  resource_group_name = data.azurerm_resource_group.existing.name
  tags                = var.tags
}

# Public DNS A Record for www
resource "azurerm_dns_a_record" "www" {
  name                = "www"
  zone_name           = azurerm_dns_zone.public.name
  resource_group_name = data.azurerm_resource_group.existing.name
  ttl                 = 1
  records             = [var.www_record_ip]
}

# Private DNS Zone
resource "azurerm_private_dns_zone" "private" {
  name                = var.private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.existing.name
  tags                = var.tags
}

# Virtual Network Link for Private DNS
resource "azurerm_private_dns_zone_virtual_network_link" "manufacturing_link" {
  name                  = "manufacturing-link"
  resource_group_name   = data.azurerm_resource_group.existing.name
  private_dns_zone_name = azurerm_private_dns_zone.private.name
  virtual_network_id    = data.azurerm_virtual_network.manufacturing_vnet.id
  registration_enabled  = false
  tags                  = var.tags
}

# Private DNS A Record for sensorvm
resource "azurerm_private_dns_a_record" "sensorvm" {
  name                = "sensorvm"
  zone_name           = azurerm_private_dns_zone.private.name
  resource_group_name = data.azurerm_resource_group.existing.name
  ttl                 = 1
  records             = [var.sensor_vm_ip]
}