resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
  depends_on           = [azurerm_virtual_network.vnet]
}

module "vm" {
  source                        = "./modules/vm"
  for_each                      = var.vm
  rg_name                       = var.rg_name
  location                      = var.location
  vm_name                       = each.value.vm_name
  vm_size                       = each.value.vm_size
  vm_admin_username             = each.value.vm_admin_username
  os_image                      = var.os_image
  os_license_type               = var.os_license_type
  os_image_id                   = var.os_image_id
  os_disk                       = each.value.os_disk
  data_disk                     = each.value.data_disk
  vm_tags                       = each.value.tags
  vnet_name                     = azurerm_virtual_network.vnet.name
  subnet_address_prefixes       = var.subnet_address_prefixes
  network_interface_name        = each.value.network_interface_name
  private_ip_address_allocation = var.private_ip_address_allocation
  private_ip_address            = each.value.private_ip_address
  vnet_address_space            = var.vnet_address_space
  subnet_id                     = azurerm_subnet.subnet.id
}

module "storageaccount" {
  source = "./modules/storageaccount"
  for_each = var.storageaccount
  storageaccount_name = each.value.storageaccount_name
  resource_group_name = var.rg_name
  location = var.location
  account_tier = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind = each.value.account_kind
  versioning_enabled = each.value.versioning_enabled
  share_access_tier = each.value.share_access_tier
  delete_retention_policy_days = each.value.delete_retention_policy_days
  container_delete_retention_policy_days = each.value.container_delete_retention_policy_days
  retention_policy_days = each.value.retention_policy_days
  change_feed_enabled = each.value.change_feed_enabled
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled
  tags = each.value.tags
  
}
