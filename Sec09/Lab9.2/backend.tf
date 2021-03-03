terraform {
  backend "azurerm" {
    resource_group_name  = "Terra-rg"
    storage_account_name = "remotesaprimera01"
    container_name       = "tfstate"
    key                  = "Lab9.2.tfstate"
  }
}