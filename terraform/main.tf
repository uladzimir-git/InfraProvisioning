provider "azurerm" {
  version = ">=2.5.0"
  features {}
}


resource "azurerm_resource_group" "spacegame" {
  name     = local.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_app_service_plan" "spacegame" {
  name                = local.app_service_plan_name
  location            = azurerm_resource_group.spacegame.location
  resource_group_name = azurerm_resource_group.spacegame.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "spacegame" {
  name                = local.app_service_name
  location            = azurerm_resource_group.spacegame.location
  resource_group_name = azurerm_resource_group.spacegame.name
  app_service_plan_id = azurerm_app_service_plan.spacegame.id

  site_config {
    linux_fx_version = "DOTNETCORE|3.1"
    app_command_line = "dotnet Tailspin.SpaceGame.Web.dll"
  }
}

output "appservice_name" {
  value       = azurerm_app_service.spacegame.name
  description = "The App Service name"
}
output "website_hostname" {
  value       = azurerm_app_service.spacegame.default_site_hostname
  description = "The hostname of the website"
}
