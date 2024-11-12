variable "sp_name" {
  type        = string
  description = "name of service plan"
  default     = "jh-sp"
}
variable "rg_name" {
  type        = string
  description = "name of resource group"
  default     = "jh-rg"
}
variable "location" {
  type        = string
  description = "location of resource"
  default     = "westeurope"
}