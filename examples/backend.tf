terraform {
  backend "azurerm" {
    resource_group_name  = "resource-group-name"
    storage_account_name = "tfstate-storageaccount"
    container_name       = "tfstateappinsightcontainer"
    key                  = "tfstate/appinsightstate"
  }
}
