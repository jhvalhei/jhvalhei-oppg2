variable "rg_name" {
  type        = string
  description = "name of rg"
  default     = "rg-ecommerse-jh"
}
variable "location" {
  type        = string
  description = "location of resource"
  default     = "westeurope"
}
variable "sc_name" {
  type = string
  description = "name of storage--container"
  default = "jh-sc"
}
variable "sa_prefix" {
  type = string
  description = "prefix of storage account"
  default = "sa"
}