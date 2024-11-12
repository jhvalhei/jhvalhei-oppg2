variable "location" {
  type        = string
  description = "location of resource"
  default     = "westeurope"
}
variable "rg_name" {
  type        = string
  description = "name og resource group"
  default     = "jh-rg"
}
variable "lb_name" {
  type        = string
  description = "name of load balancer"
  default     = "jh-lb"
}
variable "vnet_name" {
  type        = string
  description = "name of vnet"
  default     = "jh-vnet"
}
variable "subnet1_name" {
  type        = string
  description = "name of subnet1"
  default     = "jh-subnet1"
}
variable "subnet2_name" {
  type        = string
  description = "name of subnet2"
  default     = "jh-subnet2"
}