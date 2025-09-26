variable "tenant_domain" {
  description = "Де це знайти є у вимогах до лаби"
  type        = string
}

variable "internal_alias" {
  description = "Логін внутрішнього користувача"
  type        = string
  default     = "az104-user1"
}

variable "external_email" {
  description = "Email, на який має прийти запрошення"
  type        = string
}

variable "external_name" {
  description = "Ім'я гостя (того користувача що запрошуєм)"
  type        = string
}
