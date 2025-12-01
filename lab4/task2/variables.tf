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

variable "manufacturing_vnet_name" {
  description = "Name of the Manufacturing VNet"
  type        = string
  default     = "ManufacturingVnet"
}

variable "manufacturing_vnet_address_space" {
  description = "Address space for Manufacturing VNet"
  type        = list(string)
  default     = ["10.30.0.0/16"]
}

variable "manufacturing_subnets" {
  description = "Subnets for Manufacturing VNet"
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
  default = {
    sensor1 = {
      name             = "SensorSubnet1"
      address_prefixes = ["10.30.20.0/24"]
    }
    sensor2 = {
      name             = "SensorSubnet2"
      address_prefixes = ["10.30.21.0/24"]
    }
  }
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    environment = "lab"
    task        = "task2"
  }
}