output "key_vault_id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.this.id
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.this.vault_uri
}

output "secret_id" {
  description = "Secret ID (if created)"
  value       = try(azurerm_key_vault_secret.this[0].id, null)
}

output "secret_name" {
  description = "Secret Name (if created)"
  value       = try(azurerm_key_vault_secret.this[0].name, null)
}

output "keyvault_name" {
  description = "Name of the created Key Vault"
  value       = azurerm_key_vault.this.name
}
