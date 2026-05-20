terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Leave these empty to receive parameters safely during pipeline initialization
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
    use_azure_rbac       = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}
