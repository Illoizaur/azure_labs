terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}

data "azurerm_client_config" "current" {}

resource "azurerm_management_group" "az104_mg1" {
  name         = "az104-mg1"
  display_name = "az104-mg1"
}

resource "azuread_group" "helpdesk" {
  display_name     = "helpdesk"
  owners           = [data.azurerm_client_config.current.object_id]
  security_enabled = true
}

resource "azurerm_role_assignment" "vm_contributor_helpdesk" {
  scope                = azurerm_management_group.az104_mg1.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azuread_group.helpdesk.object_id
}

resource "azurerm_role_definition" "custom_support_request" {
  name        = "Custom Support Request"
  scope       = azurerm_management_group.az104_mg1.id
  description = "A custom contributor role for support requests."

  permissions {
    actions = [
      "Microsoft.Support/supportTickets/read",
      "Microsoft.Support/supportTickets/write",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Resources/subscriptions/read"
    ]
    
    not_actions = [
      "Microsoft.Support/register/action"
    ]
  }

  assignable_scopes = [
    azurerm_management_group.az104_mg1.id
  ]
}