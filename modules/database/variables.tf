variable "mysqlserver_name" {
  type        = string
  description = "name of mysql server"
  default     = "jh-mysqlserver"
}
variable "rg_name" {
  type        = string
  description = "name of resource group"
  default     = "jh-rg"
}
variable "mysql_db" {
  type        = string
  description = "name of mysql database"
  default     = "jh-mysqldb"
}
variable "location" {
  type        = string
  description = "location of resource"
  default     = "westeurope"
}
variable "sa_name" {
  type        = string
  description = "name of storage account for images"
}
variable "mysqlserver_admin_username" {
  type      = string
  default   = "4dm1n157r470r"
  sensitive = true
}
