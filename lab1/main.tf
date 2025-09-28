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

module "internal_user" {
  source         = "./modules/user_internal"
  internal_alias = var.internal_alias
  tenant_domain  = var.tenant_domain
}

module "guest_user" {
  source        = "./modules/user_guest"
  external_email = var.external_email
  external_name  = var.external_name
}

module "it_group" {
  source = "./modules/group"
}

module "group_membership" {
  source          = "./modules/group_membership"
  group_id        = module.it_group.group_id
  internal_user_id = module.internal_user.internal_user_id
  guest_user_id    = module.guest_user.guest_user_id
}
