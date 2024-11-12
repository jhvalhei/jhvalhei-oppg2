locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name = "${var.rg_name}-${local.workspaces_suffix}"

}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

module "storage" {
  source = "../modules/storage"
  rg_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sa_prefix = var.sa_prefix
  sc_name = var.sc_name

}
module "database" {
  source = "../modules/database"
  sa_name = module.storage.sa_name
  rg_name = azurerm_resource_group.rg.name
}
module "networking" {
  source  = "../modules/networking"
  rg_name = azurerm_resource_group.rg.name
}