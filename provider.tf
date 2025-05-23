terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.100.0, <4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

