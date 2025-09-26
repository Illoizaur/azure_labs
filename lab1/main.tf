terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.50"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azuread" {}

resource "random_password" "internal_user" {
  length  = 16
  special = true
}

resource "azuread_user" "internal" {
  user_principal_name = "${var.internal_alias}@${var.tenant_domain}"
  display_name        = var.internal_alias
  mail_nickname       = var.internal_alias

  account_enabled = true
  password        = random_password.internal_user.result
  force_password_change = true

  job_title      = "IT Lab Administrator"
  department     = "IT"
  usage_location = "US"
}

resource "azuread_invitation" "guest" {
  user_email_address         = var.external_email
  user_display_name  = var.external_name
  redirect_url        = "https://portal.azure.com"

  message {
    body = "Welcome to Azure and our group project"
  }

  user_type = "Guest"
}

data "azuread_client_config" "current" {}

resource "azuread_group" "it_lab_administrators" {
  display_name         = "IT Lab Administrators"
  description          = "Administrators that manage the IT lab"
  security_enabled     = true
  mail_enabled         = false
  assignable_to_role   = false
  
  owners = [data.azuread_client_config.current.object_id]

  mail_nickname = "it-lab-administrators"
  
  lifecycle {
    prevent_destroy = false
  }
}

resource "azuread_group_member" "az104_user1_member" {
  group_object_id  = azuread_group.it_lab_administrators.object_id
  member_object_id = azuread_user.internal.object_id
  
  depends_on = [azuread_user.internal]
}

resource "azuread_group_member" "guest_user_member" {
  group_object_id  = azuread_group.it_lab_administrators.object_id
  member_object_id = azuread_invitation.guest.user_id
  
  depends_on = [azuread_invitation.guest]
}
