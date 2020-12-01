provider "azurerm" {
  version = ">=2.5.0"
  features {}
}

resource "random_integer" "app_service_name_suffix" {
  min = 1000
  max = 9999
}

resource "azurerm_resource_group" "spacegame" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_app_service_plan" "spacegame" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.spacegame.location
  resource_group_name = azurerm_resource_group.spacegame.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "spacegame_dev" {
  name                = "${var.app_service_name_prefix}-dev-${random_integer.app_service_name_suffix.result}"
  location            = azurerm_resource_group.spacegame.location
  resource_group_name = azurerm_resource_group.spacegame.name
  app_service_plan_id = azurerm_app_service_plan.spacegame.id

  site_config {
    linux_fx_version = "DOTNETCORE|3.1"
    app_command_line = "dotnet Tailspin.SpaceGame.Web.dll"
  }
}

output "appservice_name_dev" {
  value       = azurerm_app_service.spacegame_dev.name
  description = "The App Service name for the dev environment"
}
output "website_hostname_dev" {
  value       = azurerm_app_service.spacegame_dev.default_site_hostname
  description = "The hostname of the website in the dev environment"
}
