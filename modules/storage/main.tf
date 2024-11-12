resource "random_string" "random" {
  length  = 10
  special = false
  upper   = false
}
#Storage account for storing images
resource "azurerm_storage_account" "sa" {
  name                     = "${var.sa_prefix}${random_string.random.result}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azurerm_storage_container" "sc" {
  name                  = var.sc_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

output "sa_name" {
  value = azurerm_storage_account.sa.name
}
