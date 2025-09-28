resource "azuread_group_member" "internal_member" {
  group_object_id  = var.group_id
  member_object_id = var.internal_user_id
}

resource "azuread_group_member" "guest_member" {
  group_object_id  = var.group_id
  member_object_id = var.guest_user_id
}
