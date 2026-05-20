terraform {
  required_version = ">= 1.5.0" # Satisfies the tflint version requirement

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

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
