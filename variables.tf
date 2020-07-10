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
  default = "false"
}

