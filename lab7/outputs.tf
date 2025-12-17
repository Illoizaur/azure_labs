output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}

output "sas_url_instruction" {
  value = "Використовуйте Azure Portal або CLI для генерації SAS токена для конкретного файлу."
}