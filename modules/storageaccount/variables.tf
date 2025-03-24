variable "tags" {
  type = map(any)
  default = {
    environment = "dev"
  }
}

variable "storageaccount_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "account_kind" {
  type = string
}


variable "infrastructure_encryption_enabled" {
  type = bool
}

variable "versioning_enabled" {
  type = bool
}

variable "change_feed_enabled" {
  type = bool
}

variable "delete_retention_policy_days" {
  type = number
}

variable "container_delete_retention_policy_days" {
  type = number
}

variable "retention_policy_days" {
  type = number
}

variable "share_name" {
  type = string
}

variable "share_quota" {
  type = number
}

variable "share_access_tier" {
  type = string
}


