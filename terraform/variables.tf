variable "project_name" {
  default = "myProject"
}

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

variable "projectName" {
  type = string
}
variable "serviceName" {
  type = string
}
variable "environment" {
  type = string
}

locals {
  rgName   = "rg-${var.projectName}-${var.serviceName}-${var.environment}"
  vnetName = "vnet-${var.environment}-${var.location}-001"
  snetName = "snet-${var.environment}-${var.location}-001"
  nicName  = "nic-01-${local.vmName}-${var.environment}-001"
  pipName  = "pip-${local.vmName}-${var.environment}-${var.location}-001"
}



