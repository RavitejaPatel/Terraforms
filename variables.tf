# --- Backend Infrastructure Mapping Variables ---

variable "backend_resource_group_name" {
  type        = string
  description = "The Resource Group containing the remote tfstate storage account"
  default     = "rg-terraform-backend"
}

variable "backend_storage_account_name" {
  type        = string
  description = "The globally unique name of the backend Azure Storage Account"
  default     = "ravitejatfstatebackend"
}

variable "backend_container_name" {
  type        = string
  description = "The storage container folder name for state blob allocations"
  default     = "tfstate"
}

variable "backend_key" {
  type        = string
  description = "The destination filename for the raw state mapping data"
  default     = "prod.terraform.tfstate"
}


# --- Application Architecture Logic Variables ---

variable "location" {
  type        = string
  description = "The target data center region location"
  default     = "East US"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "CIDR block allocation for core network infrastructure components"
  default     = ["10.0.0.0/16"]
}
