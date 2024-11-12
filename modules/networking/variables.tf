variable "location" {
    type = string
    description = "location of resource"
    default = "westeurope"
}
variable "rg_name" {
  type = string
  description = "name og resource group"
  default = "jh-rg"
}
variable "lb_name" {
  type = string
  description = "name of load balancer"
  default = "jh-lb"
}
