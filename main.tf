resource "azurerm_key_vault" "this" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name

  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  network_acls {
    default_action = var.default_action
    bypass         = var.bypass
  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "this" {
  count        = var.create_secret ? 1 : 0
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.this.id
}
