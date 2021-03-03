provider "azurerm" {
  version = "~> 2.18"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "Terra-rg"
  location = "West Europe"
}

/*resource "azurerm_key_vault" "rg" {
  name                = "kvault-primera-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = "f8ed156b-ad1f-4716-a62e-323c45722794"
  sku_name            = "standard"
}*/

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "rg" {
  name                = "kvault-primera-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "get", "list", "create", "delete", "update",
    ]
    secret_permissions = [
      "get", "list", "set", "delete",
    ]
  }
}

resource "azurerm_storage_account" "rg" {
  name                     = "remotesaprimera01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "northeurope" #azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"
}