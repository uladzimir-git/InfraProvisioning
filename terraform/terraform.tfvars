variable "resource_group_name" {
  default = "tailspin-space-game-rg"
  description = "The name of the resource group"
}

variable "resource_group_location" {
  default = "westus"
  description = "The location of the resource group"
}

variable "app_service_plan_name" {
  default = "tailspin-space-game-asp"
  description = "The name of the app service plan"
}

variable "app_service_name_prefix" {
  default = "tailspin-space-game-web"
  description = "The beginning part of your App Service host name"
}
