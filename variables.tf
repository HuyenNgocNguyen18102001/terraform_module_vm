variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}

# variable "data_disk" {
#   type = map(object({
#     data_disk_name         = string
#     size                   = number
#     type                   = string
#     zone                   = optional(number, null)
#     caching                = optional(string, "None")
#     create_option          = optional(string, "Empty")
#     source                 = optional(string, "")
#     disk_encryption_set_id = optional(string, "")
#     data_disks_tags        = optional(map(string), {})
#   }))
#   default = {}
# }

variable "is_appliance" {
  description = "Specifies if this VM is an appliance or regular VM. Toggle this to `true` will change the naming convention of VM created by this module."
  type        = bool
  default     = false
}

variable "os_type" {
  default = "linux"
}

variable "custom_vm_name" {
  type     = string
  default  = null
  nullable = true
}
# variable "vm_size" {
#   type = string
# }
variable "vm_zone" {
  type     = number
  default  = null
  nullable = true
}
variable "vm_admin_username" {
  default = "admin-acn"
}
variable "os_license_type" {
  type     = string
  default  = null
  nullable = true
}
# variable "os_disk" {
#   description = "Define parameters for OS Disk."
#   type = object({
#     name    = string
#     size    = optional(number, 64)
#     type    = optional(string, "Standard_LRS")
#     caching = optional(string, "None")
#   })
# }

variable "os_image" {
  description = "Define source OS Image parameters, including Publisher, Offer, Sku and Version."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "os_image_id" {
  description = "Specifies resource ID of Custom Image for Virtual Machine. If this is defined, os_image is ignored. Otherwise, os_image is required."
  type        = string
  default     = null
  nullable    = true
}

# variable "os_image_plan" {

# description = "Define OS Image Plan parameters. Required when using some certain Marketplace Images like RHEL, SLES."
#   type = object({
#     name      = string
#     product   = string
#     publisher = string
#   })
#   default = null
# }

variable "vm_nic_accelerated_networking_enabled" {
  type    = bool
  default = false
}


variable "vm_nic_ip_address" {
  type    = string
  default = null
}

variable "vm_nic_ip_forwarding_enabled" {
  type    = bool
  default = false
}

variable "vm_custom_data" {
  type    = string
  default = null
}

variable "vm_user_data" {
  type    = string
  default = null
}

variable "vm_managed_identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string), [])
  })
  default = null
}

variable "vm_tags" {
  type    = map(string)
  default = {}
}

# variable "vms" {
#   type = map(object({
#     vm_name = string
#     vm_size = string
#     vm_zone = number
#   }))
# }

variable "vnet_name" {
  type = string
}
variable "subnet_name" {
  type = string
}
variable "subnet_address_prefixes" {
  type = list(string)
}

variable "private_ip_address_allocation" {
  type = string
}
# variable "private_ip_address" {
#   type = string
# }
variable "vnet_address_space" {
  type = list(string)
}

# variable "vm_name" {
#   type = string
# }

variable "vm" {
  type = map(object({
    vm_name            = string
    vm_size            = string
    tags               = map(any)
    private_ip_address = string
    network_interface_name = string
    vm_admin_username  = string
    os_disk = object({
      name    = string
      size    = number
      type    = string
      caching = string
    })
    data_disk = map(object({
      data_disk_name = string
      size    = number
      type    = string
      zone    = optional(number, null)
      caching = string
      lun     = optional(number, null)
    }))
  }))
}
