# iac-az-keyvault-module
# Azure Key Vault Deployment with Terraform
This Terraform configuration deploys an Azure Key Vault along with an optional Key Vault Secret.
## Resources
### 1. **azurerm_key_vault**
This resource defines the Azure Key Vault.
```hcl
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
```
## Arguments:

## Key Vault Configuration

- **name**: The name of the Key Vault.
- **location**: The location of the Key Vault.
- **resource_group_name**: The name of the resource group to deploy the Key Vault.
- **tenant_id**: The Tenant ID under which the Key Vault will be created.
- **sku_name**: The SKU for the Key Vault (e.g., standard, premium).
- **soft_delete_retention_days**: The retention period for soft-delete (in days).
- **purge_protection_enabled**: Whether purge protection is enabled on the Key Vault.
- **network_acls**: Defines the network ACLs for the Key Vault.
  - **default_action**: The default action for network ACLs (Allow or Deny).
  - **bypass**: Specifies what traffic is bypassed from the ACLs.
- **tags**: Tags applied to the Key Vault resource.


## 2. azurerm_key_vault_secret
This resource creates a secret inside the Key Vault. It's optional and depends on the create_secret variable.

```hcl
resource "azurerm_key_vault_secret" "this" {
  count        = var.create_secret ? 1 : 0
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.this.id
}
```
Arguments:
- **count**: Creates the secret only if create_secret is set to true.
- **name**: The name of the secret.
- **value**: The value of the secret.
- **key_vault_id**: The ID of the Key Vault where the secret will be stored.
```
```
## Variables
| Variable                      | Description                                                       |
|-------------------------------|-------------------------------------------------------------------|
| `keyvault_name`                | The name of the Azure Key Vault.                                  |
| `location`                     | The location where the Key Vault will be deployed.                |
| `resource_group_name`          | The resource group name where the Key Vault will reside.          |
| `tenant_id`                    | Azure Tenant ID for Key Vault deployment.                         |
| `sku_name`                     | SKU for the Key Vault (`standard`, `premium`).                    |
| `soft_delete_retention_days`   | Number of days to retain the Key Vault in soft delete.            |
| `purge_protection_enabled`     | Enable or disable purge protection for the Key Vault.             |
| `default_action`               | The default network ACL action (`Allow` or `Deny`).               |
| `bypass`                       | Bypass rules for network ACLs.                                    |
| `tags`                         | Tags to apply to the Key Vault.                                   |
| `create_secret`                | Whether to create a secret or not (boolean).                      |
| `secret_name`                  | The name of the secret to create.                                 |
| `secret_value`                 | The value of the secret to store.                                 |

### Example Usage
```bash
module "keyvault" {
  source              = "./modules/azurerm_key_vault"
  keyvault_name       = "mykeyvault"
  location           = "East US"
  resource_group_name = "myResourceGroup"
  tenant_id          = "00000000-0000-0000-0000-000000000000"
  sku_name           = "standard"
  soft_delete_retention_days = 90
  purge_protection_enabled   = true
  default_action      = "Deny"
  bypass              = "AzureServices"
  tags                = {
    environment = "production"
  }
  create_secret       = true
  secret_name         = "mySecret"
  secret_value        = "mySecretValue"
}
```
This configuration will create an Azure Key Vault, configure its network ACLs, enable soft delete, and optionally create a secret if create_secret is true.