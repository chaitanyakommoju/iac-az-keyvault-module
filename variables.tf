variable "keyvault_name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Location"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU name"
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention in days"
  type        = number
  default     = 90
}

variable "purge_protection_enabled" {
  description = "Enable purge protection"
  type        = bool
  default     = true
}

variable "default_action" {
  description = "Default network action"
  type        = string
  default     = "Allow"
}

variable "bypass" {
  description = "Bypass network rules for Azure services"
  type        = string
  default     = "AzureServices"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "create_secret" {
  description = "Whether to create a secret"
  type        = bool
  default     = false
}

variable "secret_name" {
  description = "Name of the secret"
  type        = string
  default     = ""
}

variable "secret_value" {
  description = "Value of the secret"
  type        = string
  default     = ""
}
variable "orgname" {
  description = "Organization Name"
  type        = string
}

variable "region" {
  description = "Azure Region"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}
