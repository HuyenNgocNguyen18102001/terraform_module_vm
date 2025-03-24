resource "azurerm_storage_account" "storageaccount" {
  name                     = var.storageaccount_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  blob_properties {
    versioning_enabled  = var.versioning_enabled
    change_feed_enabled = var.change_feed_enabled
    dynamic "delete_retention_policy" {
      for_each = var.delete_retention_policy_days != null ? [1] : []
      content {
        days = var.delete_retention_policy_days
      }
    }
    dynamic "container_delete_retention_policy" {
      for_each = var.container_delete_retention_policy_days != null ? [1] : []
      content {
        days = var.container_delete_retention_policy_days
      }
    }
  }
  share_properties {
    retention_policy {
      days = var.retention_policy_days
    }
  }
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  tags                              = var.tags
}
