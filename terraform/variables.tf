variable "resource_group_location" {
  description = "The location of the resource group"
}

variable "project_name" {
  type = string
}

locals {
  resource_group_name = "rg-${var.project_name}-${lower(terraform.workspace)}"
  app_service_plan_name = "plan-${var.project_name}-${lower(terraform.workspace)}"
  app_service_name = "app-${var.project_name}-${lower(terraform.workspace)}"
  
 
}



