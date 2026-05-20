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
