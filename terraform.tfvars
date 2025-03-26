rg_name  = "1-39478d58-playground-sandbox"
location = "West US"

os_image = {
  publisher = "Canonical"
  offer     = "ubuntu-24_04-lts"
  sku       = "server"
  version   = "latest"
}
os_license_type = null
# os_disk = {
#   name    = "helen-osdisk"
#   size    = 30
#   type    = "Standard_LRS"
#   caching = "None"
# }
vm_tags = {
  environment = "dev"
}
vnet_name                     = "helen-vnet01"
subnet_name                   = "helen-subnet01"
subnet_address_prefixes       = ["10.0.0.0/24"]
private_ip_address_allocation = "Static"
vnet_address_space            = ["10.0.0.0/16"]
#   os_image_plan = {
#   name      = "UbuntuServer"
#   product   = "Ubuntu"
#   publisher = "Canonical"
# }
vm = {
  "helen01" = {
    vm_name            = "helen"
    vm_size            = "Standard_D2s_v3"
    private_ip_address = "10.0.0.10"
    vm_admin_username  = "adminuser1"
    network_interface_name = "helen-nic01"
    os_disk = {
      name    = "helen-osdiskvm01"
      size    = 30
      type    = "Standard_LRS"
      caching = "None"

    }
    data_disk = {
      "helen-datadiskvm01" = {
        data_disk_name    = "helen-datadisk"
        size    = 10
        type    = "Standard_LRS"
        caching = "None"
        lun     = 10
      },
      "helen-datadisk2vm01" = {
        data_disk_name    = "helen-datadisk2"
        size    = 11
        type    = "Standard_LRS"
        caching = "None"
        lun     = 11
      }
    }
    tags = {
      environment = "dev"
      owner       = "helen"
    }
  },
  "helen02" = {
    vm_name            = "helen02"
    vm_size            = "Standard_D2s_v3"
    private_ip_address = "10.0.0.11"
    network_interface_name = "helen-nic02"
    vm_admin_username  = "adminuser2"
    os_disk = {

      name    = "helen-osdiskvm02"
      size    = 30
      type    = "Standard_LRS"
      caching = "None"


    }
    data_disk = {
      "helen-datadiskvm02" = {
        data_disk_name    = "helen-datadiskhelen02"
        size    = 12
        type    = "Standard_LRS"
        caching = "None"
        lun     = 12
      }
    }
    tags = {
      environment = "devvm02"
      owner       = "helen"
    }
  }
}