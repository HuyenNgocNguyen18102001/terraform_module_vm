# data "azurerm_resource_group" "data_rg" {
#   name = "1-9c90b4c2-playground-sandbox"
# }

# data "azurerm_virtual_network" "data_vnet" {
#   name                = "helen-vnet"
#   resource_group_name = data.azurerm_resource_group.data_rg.name
# }

# data "azurerm_subnet" "data_subnet" {
#   name                 = "helen-subnet"
#   resource_group_name  = data.azurerm_resource_group.data_rg.name
#   virtual_network_name = data.azurerm_virtual_network.data_vnet.name
# }
