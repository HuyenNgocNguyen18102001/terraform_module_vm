output "name" {
  description = "Name of VM"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "resource_group_name" {
  description = "Name of Resource Group of VM"
  value       = azurerm_linux_virtual_machine.vm.resource_group_name
}

output "id" {
  description = "Resource ID of VM"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "location" {
  description = "Azure Region of VM"
  value       = azurerm_linux_virtual_machine.vm.location
}

output "msi_principal_id" {
  description = "Principal ID (a.k.a. Object ID) of Managed Identity assigned to the VM"
  value       = var.vm_managed_identity != null ? azurerm_linux_virtual_machine.vm.identity[0].principal_id : ""
}

output "private_ip_address" {
  description = "Private IP assigned to this VM"
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
}