resource "azurerm_service_plan" "sp" {
  name                = var.sp_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}