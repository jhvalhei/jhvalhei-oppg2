resource "random_string" "randompass" {
  length           = 10
  special          = false
  upper = false
}

resource "azurerm_mssql_server" "mysqlserver" {
  name                         = var.mysqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.mysqlserver_admin_username    # burde kanskje random-generere
  administrator_login_password = "${random_string.randompass.result}"
}

resource "azurerm_mssql_database" "mysqldb" {
  name         = var.mysql_db
  server_id    = azurerm_mssql_server.mysqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  }

  data "azurerm_storage_account" "sa" {
  name                = var.sa_name
  resource_group_name = var.rg_name
}
