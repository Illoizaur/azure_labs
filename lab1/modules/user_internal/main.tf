resource "random_password" "internal_user" {
  length  = 16
  special = true
}

resource "azuread_user" "internal" {
  user_principal_name = "${var.internal_alias}@${var.tenant_domain}"
  display_name        = var.internal_alias
  mail_nickname       = var.internal_alias

  account_enabled        = true
  password               = random_password.internal_user.result
  force_password_change  = true

  job_title      = "IT Lab Administrator"
  department     = "IT"
  usage_location = "US"
}

output "internal_user_id" {
  value = azuread_user.internal.object_id
}
