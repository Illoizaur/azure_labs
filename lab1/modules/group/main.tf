data "azuread_client_config" "current" {}

resource "azuread_group" "it_lab_administrators" {
  display_name       = "IT Lab Administrators"
  description        = "Administrators that manage the IT lab"
  security_enabled   = true
  mail_enabled       = false
  assignable_to_role = false

  owners = [data.azuread_client_config.current.object_id]

  mail_nickname = "it-lab-administrators"
}

output "group_id" {
  value = azuread_group.it_lab_administrators.object_id
}
