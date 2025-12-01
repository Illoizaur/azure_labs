variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg4"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "asg_name" {
  description = "Name of the Application Security Group"
  type        = string
  default     = "asg-web"
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "myNSGSecure"
}

variable "core_vnet_name" {
  description = "Name of the Core Services VNet"
  type        = string
  default     = "CoreServicesVnet"
}

variable "shared_subnet_name" {
  description = "Name of the SharedServices Subnet"
  type        = string
  default     = "SharedServicesSubnet"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    environment = "lab"
    task        = "task3"
  }
}