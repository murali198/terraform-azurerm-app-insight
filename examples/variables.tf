variable "subscription_id" {
  description = "(Required) The prefix for the resources created in the specified Azure Resource Group"
  type        = string
}

variable "tenant_id" {
  description = "(Required) The prefix for the resources created in the specified Azure Resource Group"
  type        = string
}

variable "client_id" {
  description = "(Required) The prefix for the resources created in the specified Azure Resource Group"
  type        = string
  default     = ""
}

variable "client_secret" {
  description = "(Required) The prefix for the resources created in the specified Azure Resource Group"
  type        = string
  default     = ""
}

variable "rg_name" {
  description = "he name of the resource group in which to create the PostgreSQL Server"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the resources"
  default     = {}
}

