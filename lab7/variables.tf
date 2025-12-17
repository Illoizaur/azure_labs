variable "resource_group_name" {
  description = "Назва групи ресурсів"
  default     = "az104-rg7"
}

variable "location" {
  description = "Регіон розгортання"
  default     = "East US"
}

variable "storage_account_name" {
  description = "Унікальне ім'я облікового запису сховища (3-24 символи, тільки літери та цифри)"
  default     = "stg104lab7unique"
}

variable "vnet_name" {
  default = "vnet1"
}

variable "blob_container_name" {
  default = "data"
}

variable "file_share_name" {
  default = "share1"
}