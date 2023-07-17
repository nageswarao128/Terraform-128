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
  alias                         = "app-sub"
  subscription_id = "2bd94ec0-b962-4bad-84a8-7900bb20b520"
  tenant_id              = "73d3d213-f87a-4465-9a7e-67bd625fdf9c"
  client_id                = "b57b2822-9a42-44c6-b239-d37ff4a8e782"
  client_secret      = "Q3w8Q~kFXyWJDQFzq6CnoYJNfrTUBE5RmnZR_ai_"
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


