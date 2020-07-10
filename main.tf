terraform {
  required_version = ">= 0.12"
}

# Azure Provider
provider "azurerm" {
  version = "~>2.17.0"
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "arcade" {
  name     = "${var.prefix}-containerapp-demo"
  location = var.location
}

# Utilize the web_app_container module from TFE Private Registry
module "web_app_container" {
  source  = "app.terraform.io/multicloud/web-app-container/azurerm"
  version = "2.6.4"

  name                    = var.prefix
  resource_group_name     = azurerm_resource_group.arcade.name
  resource_group_location = azurerm_resource_group.arcade.location
  container_image         = var.image
  container_type          = "docker"
  https_only              = var.https_only
  port                    = "80"
}
