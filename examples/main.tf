provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

module "appinsight" {
  source  = "../"
  rg_name = var.rg_name
  tags    = var.tags
  app_insights_config = {
    my-app-insight = {
      application_type  = "other"
      retention_in_days = 180
      wksp_sku          = "PerGB2018"
    }
  }
}


