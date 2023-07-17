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
#name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup-${random_integer.ri.result}"
  location = "eastus"
}

resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "webapp-asp-${random_integer.ri.result}"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "webapp-${random_integer.ri.result}"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
#   source_control {
#     repo_url           = "https://github.com/myprofilr/Cera-new-code.git"
#     branch             = "master"
#     manual_integration = true
#     use_mercurial      = false
#   }
}

resource "azurerm_app_service" "webapp11"{
    name  = "webapp12-${random_integer.ri.result}"
    location = "eastus"
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
}

resource "azurerm_app_service" "webapp12"{
    name  = "webapp13-${random_integer.ri.result}"
    location = "eastus"
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
}


resource "azurerm_sql_server" "myresource" {
   name = "sqlserver-128"
   resource_group_name = azurerm_resource_group.rg.name
   location = "eastus"
   version = "12.0"
   administrator_login = "mradministrator"
   administrator_login_password = "thisIspnr@128"
}