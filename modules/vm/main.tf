resource "random_password" "password" {
  length           = 20
  lower            = true
  upper            = true
  numeric          = true
  special          = true
  override_special = "!@#$%^&*"
}


resource "azurerm_network_interface" "network_interface_ids" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "test"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation == null ? "Dynamic" : "Static"
    private_ip_address            = var.private_ip_address == null ? null : var.private_ip_address
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  resource_group_name             = var.rg_name
  location                        = var.location
  name                            = var.vm_name
  size                            = var.vm_size
  zone                            = var.vm_zone != null ? var.vm_zone : null
  admin_username                  = var.vm_admin_username
  admin_password                  = random_password.password.result
  disable_password_authentication = false
  license_type                    = var.os_image == null ? null : var.os_license_type
  network_interface_ids           = [azurerm_network_interface.network_interface_ids.id] #Avoid VM attach 2 NIC instead of each NIC per VM 
  os_disk {
    name                 = var.os_disk.name
    disk_size_gb         = var.os_disk.size
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.type
  }
  dynamic "source_image_reference" {
    for_each = var.os_image_id == null ? [1] : []
    content {
      publisher = var.os_image.publisher
      offer     = var.os_image.offer
      sku       = var.os_image.sku
      version   = var.os_image.version
    }
  }

  source_image_id = var.os_image_id
  # dynamic "plan" {
  #   for_each = var.os_image_id == null ? (var.os_image_plan != null ? [1] : []) : []
  #   content {
  #     name      = var.os_image_plan.name
  #     product   = var.os_image_plan.product
  #     publisher = var.os_image_plan.publisher
  #   }
  # }

  dynamic "identity" {
    for_each = var.vm_managed_identity != null ? [1] : []
    content {
      type         = var.vm_managed_identity.type
      identity_ids = var.vm_managed_identity.type == "UserAssigned" || var.vm_managed_identity.type == "SystemAssigned, UserAssigned" ? var.vm_managed_identity.identity_ids : []
    }
  }

  boot_diagnostics {
    storage_account_uri = ""
  }

  custom_data = var.vm_custom_data
  user_data   = var.vm_user_data

  tags = var.vm_tags

  depends_on = [azurerm_network_interface.network_interface_ids]

  lifecycle {
    ignore_changes = [admin_password]
  }
}

resource "azurerm_managed_disk" "data_disk" {
  for_each             = var.data_disk
  name                 = each.value.data_disk_name
  resource_group_name  = var.rg_name
  location             = var.location
  zone                 = each.value.zone != null ? each.value.zone : null
  storage_account_type = each.value.type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.size
  tags                 = merge(var.vm_tags, each.value.data_disks_tags)

  depends_on = [azurerm_linux_virtual_machine.vm]
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  for_each           = var.data_disk
  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm.id
  lun                = each.value.lun
  caching            = "ReadWrite"
  depends_on         = [azurerm_managed_disk.data_disk, azurerm_linux_virtual_machine.vm]
}

