# VARIABLES

# Public URL Prefix = http://PREFIX.azurewebsites.net/
variable "prefix" {
  default = "robpco-arcade"
}

# Change to robpco/pizzaplanet or palacearcade
variable "image" {
  default = "robpco/palacearcade"
}

# Choose a location
variable "location" {
  default = "centralus"
}

variable "https_only" {
  default = "true"
}

# Azure Infrastrcture
provider "azurerm" {}

# Create Resource Group
resource "azurerm_resource_group" "arcade" {
  name     = "${var.prefix}-containerapp-demo"
  location = "${var.location}"
}

# Utilize the web_app_container module from TFE Private Registry
module "web_app_container" {
  source  = "app.terraform.io/multicloud/web-app-container/azurerm"
  version = "1.5.0"

  name                = "${var.prefix}"
  resource_group_name = "${azurerm_resource_group.arcade.name}"
  container_image     = "${var.image}"
  container_type      = "docker"
  https_only          = "${var.https_only}"
  port                = "80"
}

output "container_app_url" {
  value = "https://${module.web_app_container.hostname}"
}
