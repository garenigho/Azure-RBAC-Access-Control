terraform {
  backend "azurerm" {
    resource_group_name  = "RG-TerraformState"
    storage_account_name = "tfstatentfs12813"
    container_name       = "tfstate"
    key                  = "rbac-lab.terraform.tfstate"
  }
}