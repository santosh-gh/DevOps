# Azurerm Provider configuration
provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
  tags = {
    environment = var.environment
  }
}

# Create Service Paln
resource "azurerm_app_service_plan" "service-plan" {
  name = var.serviceplan_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind = "Windows"
  reserved = false
  sku {
    tier = "Free"
    size = "F1"
  }
  tags = {
    environment = var.environment
  }
}

# Create a App Service
resource "azurerm_app_service" "app-service" {
  name = var.appservice_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

  tags = {
    environment = var.environment
  }
}