data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "core_vnet" {
  name                = var.core_vnet_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "shared_subnet" {
  name                 = var.shared_subnet_name
  virtual_network_name = var.core_vnet_name
  resource_group_name  = var.resource_group_name
}

# Application Security Group
resource "azurerm_application_security_group" "asg_web" {
  name                = var.asg_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  tags                = var.tags
}

# Network Security Group
resource "azurerm_network_security_group" "nsg_secure" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  tags                = var.tags
}

# Inbound Rule - Allow ASG Traffic
resource "azurerm_network_security_rule" "allow_asg" {
  name                                       = "AllowASG"
  priority                                   = 100
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "Tcp"
  source_port_range                          = "*"
  destination_port_ranges                    = ["80", "443"]
  source_application_security_group_ids      = [azurerm_application_security_group.asg_web.id]
  destination_address_prefix                 = "*"
  resource_group_name                        = data.azurerm_resource_group.existing.name
  network_security_group_name                = azurerm_network_security_group.nsg_secure.name
}

# Outbound Rule - Deny Internet
resource "azurerm_network_security_rule" "deny_internet_outbound" {
  name                        = "DenyInternetOutbound"
  priority                    = 4096
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = data.azurerm_resource_group.existing.name
  network_security_group_name = azurerm_network_security_group.nsg_secure.name
}

# Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "nsg_subnet_association" {
  subnet_id                 = data.azurerm_subnet.shared_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg_secure.id
}