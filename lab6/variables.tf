variable "resource_group_name" {
  default = "az104-rg6"
}

variable "location" {
  default = "North Europe" # Змінено для уникнення SkuNotAvailable
}

variable "admin_username" {
  default = "localadmin"
}

variable "admin_password" {
  default = "P@ssw0rd12345!"
}

variable "vm_size" {
  default = "Standard_B1s" # Мінімальний стабільний розмір
}