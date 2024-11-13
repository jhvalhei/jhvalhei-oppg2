locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  sp_name = "${var.sp_name}-${local.workspaces_suffix}"

}

resource "azurerm_service_plan" "sp" {
  name                = local.sp_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}