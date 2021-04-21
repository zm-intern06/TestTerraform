provider "azurerm" {
  features {}

  subscription_id = "25a98a18-5e94-4b21-9d17-e8cf45bfd81f"
  client_id       = "230858f3-b2bc-4f72-8851-5dcf5f44d789"
  client_secret   = "AJ_2C_.w2yKoWjCvoEWFKBSN4eCvADuIIy"
  tenant_id       = "558506eb-9459-4ef3-b920-ad55c555e729"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.56.0"
    }
  }
   backend "remote" {
    organization = "zm-intern06"

    workspaces {
      name = "testIntegration"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "spn_terraform_rg"
  location = "westeurope"
}

resource "azurerm_storage_account" "storage" {
  name                     = "terraform0spn1storage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
}
