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

variable "core_vnet_name" {
  description = "Name of the Core Services VNet"
  type        = string
  default     = "CoreServicesVnet"
}

variable "core_vnet_address_space" {
  description = "Address space for Core Services VNet"
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "core_subnets" {
  description = "Subnets for Core Services VNet"
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
  default = {
    shared = {
      name             = "SharedServicesSubnet"
      address_prefixes = ["10.20.10.0/24"]
    }
    database = {
      name             = "DatabaseSubnet"
      address_prefixes = ["10.20.20.0/24"]
    }
  }
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    environment = "lab"
    task        = "task1"
  }
}