variable "rg_name" {
  type = string
  description = "name of rg"
  default = "jh-rg"
}
variable "sa_prefix" {
  type = string
  description = "prefix of storage account"
  default = "sa"
}
variable "location" {
  type = string
  description = "location of resource"
}
variable "sc_name" {
  type = string
  description = "name of storage container"
}