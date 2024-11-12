resource "azurerm_public_ip" "lb_ip" {
  name                = "lb-ip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "lb-frontend-ip"
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
}