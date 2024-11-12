resource "azurerm_mssql_server" "mysqlserver" {
  name                         = var.mysqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"    # burde kanskje random-generere
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
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