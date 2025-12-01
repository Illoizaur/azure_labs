output "asg_id" {
  description = "ID of the Application Security Group"
  value       = azurerm_application_security_group.asg_web.id
}

output "asg_name" {
  description = "Name of the Application Security Group"
  value       = azurerm_application_security_group.asg_web.name
}

output "nsg_id" {
  description = "ID of the Network Security Group"
  value       = azurerm_network_security_group.nsg_secure.id
}

output "nsg_name" {
  description = "Name of the Network Security Group"
  value       = azurerm_network_security_group.nsg_secure.name
}

output "inbound_rule_id" {
  description = "ID of the Allow ASG inbound rule"
  value       = azurerm_network_security_rule.allow_asg.id
}

output "outbound_rule_id" {
  description = "ID of the Deny Internet outbound rule"
  value       = azurerm_network_security_rule.deny_internet_outbound.id
}

output "subnet_nsg_association_id" {
  description = "ID of the subnet-NSG association"
  value       = azurerm_subnet_network_security_group_association.nsg_subnet_association.id
}