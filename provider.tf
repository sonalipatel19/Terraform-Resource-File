terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.30.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}

  subscription_id = "1385ca62-7cc4-4229-b0dc-3eec83590cd8"
}