data "azurerm_resource_group" "lab" {
  name = var.resource_group_name
}

data "azurerm_virtual_machine" "fs01" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.lab.name
}