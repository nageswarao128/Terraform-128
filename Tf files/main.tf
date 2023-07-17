terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}


resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "webapp-asp"
  location            = "eastus"
  resource_group_name = "NageswarRG"
  sku {
    tier = "Free"
    size = "F1"
  }
}

# resource "azurerm_app_service" "webapp" {
#   name                = "webapp128"
#   location            = "eastus"
#   resource_group_name = "NageswarRG"
#   app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
# }



resource "azurerm_app_service" "webapp12"{
    name  = "webapp13"
    location = "eastus"
    resource_group_name = "NageswarRG"
    app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
}
