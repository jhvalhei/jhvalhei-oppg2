resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "network" {
  source  = "../modules/networking"
  rg_name = azurerm_resource_group.rg.name
}