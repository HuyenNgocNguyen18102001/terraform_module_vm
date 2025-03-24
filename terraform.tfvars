rg_name  = "1-e69e6d45-playground-sandbox"
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
data_disk = {
  "helen-datadisk" = {
    name    = "helen-datadisk"
    size    = 10
    type    = "Standard_LRS"
    caching = "None"
  }
}
vm_tags = {
  environment = "dev"
}
vnet_name                     = "helen-vnet01"
subnet_name                   = "helen-subnet01"
subnet_address_prefixes       = ["10.0.0.0/24"]
network_interface_name        = "helen-nic01"
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
    data_disk_name     = "helen-datadisk"
    os_disk = {
      "helen-osdisk" = {
        name    = "helen-osdiskvm01"
        size    = 30
        type    = "Standard_LRS"
        caching = "None"
      }
    }
    data_disk = {
      "helen-datadisk" = {
        name    = "helen-datadisk"
        size    = 10
        type    = "Standard_LRS"
        caching = "None"
        lun     = 10
      },
      "helen-datadisk2" = {
        name    = "helen-datadisk2"
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
    vm_admin_username  = "adminuser2"
    data_disk_name     = "helen-datadisk"
    os_disk = {
      "helen-osdisk" = {
        name    = "helen-osdiskvm02"
        size    = 30
        type    = "Standard_LRS"
        caching = "None"

      }
    }
    data_disk = {
      "helen-datadisk" = {
        name    = "helen-datadiskhelen02"
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