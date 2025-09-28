resource "azuread_invitation" "guest" {
  user_email_address = var.external_email
  user_display_name  = var.external_name
  redirect_url       = "https://portal.azure.com"

  message {
    body = "Welcome to Azure and our group project"
  }

  user_type = "Guest"
}

output "guest_user_id" {
  value = azuread_invitation.guest.user_id
}
