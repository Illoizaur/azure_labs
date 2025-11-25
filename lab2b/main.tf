terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "16763438-d8c0-4e82-b6b9-1c54738e6db3"
}

# Task 1: Resource Group з тегом
resource "azurerm_resource_group" "az104_rg2" {
  name     = "az104-rg2"
  location = "East US"
  tags = {
    "Cost Center" = "000"
  }
}

# Task 2: Policy "Require a tag"
data "azurerm_policy_definition" "require_tag" {
  display_name = "Require a tag and its value on resources"
}

resource "azurerm_resource_group_policy_assignment" "require_cost_center_tag" {
  name                 = "require-cost-center-tag"
  display_name         = "Require Cost Center tag and its value on resources"
  policy_definition_id = data.azurerm_policy_definition.require_tag.id
  resource_group_id    = azurerm_resource_group.az104_rg2.id
  description          = "Require Cost Center tag and its value on all resources in the resource group"
  enforce              = true

  parameters = jsonencode({
    tagName  = { value = "Cost Center" }
    tagValue = { value = "000" }
  })
}

# Task 3: Policy "Inherit tag" (закоментувати для поетапного виконання)
data "azurerm_policy_definition" "inherit_tag" {
  display_name = "Inherit a tag from the resource group if missing"
}

resource "azurerm_resource_group_policy_assignment" "inherit_cost_center_tag" {
  name                 = "inherit-cost-center-tag"
  display_name         = "Inherit the Cost Center tag and its value 000 from the resource group if missing"
  policy_definition_id = data.azurerm_policy_definition.inherit_tag.id
  resource_group_id    = azurerm_resource_group.az104_rg2.id
  description          = "Inherit the Cost Center tag and its value 000 from the resource group if missing"
  enforce              = true
  location             = "East US"

  identity {
    type = "SystemAssigned"
  }

  parameters = jsonencode({
    tagName = { value = "Cost Center" }
  })
}

# Task 4: Lock (закоментувати для поетапного виконання)
resource "azurerm_management_lock" "rg_delete_lock" {
  name       = "rg-lock"
  scope      = azurerm_resource_group.az104_rg2.id
  lock_level = "CanNotDelete"
  notes      = "Lock to prevent accidental deletion of the resource group"
}