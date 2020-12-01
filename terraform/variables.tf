variable "resource_group_location" {
  description = "The location of the resource group"
}

variable "projectName" {
  type = string
}

locals {
  resource_group_name = "rg-${var.projectName}-${lower(terraform.workspace)}"
  app_service_plan_name = "plan-${var.projectName}-${lower(terraform.workspace)}"
  app_service_name = "app-${var.projectName}-${lower(terraform.workspace)}"
  
 
}



