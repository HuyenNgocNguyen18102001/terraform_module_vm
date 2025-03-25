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
//test commit

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
  network_interface_name        = var.network_interface_name
  private_ip_address_allocation = var.private_ip_address_allocation
  private_ip_address            = each.value.private_ip_address
  vnet_address_space            = var.vnet_address_space
  data_disk_name                = each.value.data_disk_name
  subnet_id                     = azurerm_subnet.subnet.id
}