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

variable "public_dns_zone_name" {
  description = "Name of the public DNS zone"
  type        = string
  default     = "contoso-lab04-12345.com"
}

variable "private_dns_zone_name" {
  description = "Name of the private DNS zone"
  type        = string
  default     = "private.contoso.com"
}

variable "manufacturing_vnet_name" {
  description = "Name of the Manufacturing VNet"
  type        = string
  default     = "ManufacturingVnet"
}

variable "www_record_ip" {
  description = "IP address for www A record"
  type        = string
  default     = "10.1.1.4"
}

variable "sensor_vm_ip" {
  description = "IP address for sensorvm A record"
  type        = string
  default     = "10.1.1.4"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    environment = "lab"
    task        = "task4"
  }
} 