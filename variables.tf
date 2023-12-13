terraform {
  experiments = [module_variable_optional_attrs]
}

variable "rg_name" {
  description = "The name of the resource group in which to create the PostgreSQL Server"
  type        = string
}

variable "location" {
  description = "The location to deploy resources to."
  default     = null
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the resources"
  default     = {}
}

variable "app_insights_config" {
  description = "Specifies the Application insight configuration"
  type = map(object({
    application_type                     = string
    wksp_sku                             = string
    daily_data_cap_in_gb                 = optional(number)
    daily_data_cap_notification_disabled = optional(bool)
    retention_in_days                    = optional(number)
    sampling_percentage                  = optional(number)
    disable_ip_masking                   = optional(string)
  }))
}
