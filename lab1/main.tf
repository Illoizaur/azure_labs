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
