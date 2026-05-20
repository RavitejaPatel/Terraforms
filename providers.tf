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
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true # This natively handles your authenticated OIDC federation token securely
}