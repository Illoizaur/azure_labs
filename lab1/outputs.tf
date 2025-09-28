output "internal_user_id" {
  description = "Object ID внутрішнього користувача"
  value       = module.internal_user.internal_user_id
}

output "guest_user_id" {
  description = "Object ID гостьового користувача"
  value       = module.guest_user.guest_user_id
}

output "group_id" {
  description = "Object ID групи IT Lab Administrators"
  value       = module.it_group.group_id
}

output "group_members" {
  description = "Список членів групи (для перевірки)"
  value = {
    internal = module.internal_user.internal_user_id
    guest    = module.guest_user.guest_user_id
  }
}
