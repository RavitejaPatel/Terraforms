terraform {
  required_version = ">= 1.5.0" # Satisfies the tflint version requirement

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "ravitejatfstatebackend"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    use_azuread_auth     = true # FIXED: Forces the backend to use AzureAD/RBAC instead of access keys
  }
}

provider "azurerm" {
  features {}
  use_oidc       = true
  use_azure_rbac = true
}