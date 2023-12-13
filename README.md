# Azure Event Grid Topic Event Subscription
This Terraform module to manage Microsoft [Azure Application Insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) resource.

### Versioning Rule For This Modules

| Module version | Terraform version |
| -------------- | ----------------- |
| < 1.x.x        | ~> 2.46            |


### Usage

There're some examples in the examples folder. You can execute terraform apply command in examples's sub folder to try the module.

```hcl-terraform

provider "azurerm" {
  features {}

}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46"
    }
  }
  required_version = ">= 0.12"
}

module "appinsight" {
  source  = "murali198/app-insight/azurerm"
  version = "1.0.0"
  rg_name = var.rg_name
  tags    = var.tags
  app_insights_config = {
    ccg-comn-chkt-app-insight = {
      application_type  = "other"
      retention_in_days = 180
      wksp_sku          = "PerGB2018"
    }
  }
}
```

### Inputs

| Name                | Description                                                                           | Type        | Required | Default |
|---------------------|---------------------------------------------------------------------------------------|-------------|----------|---------|
| rg_name             | The name of the resource group in which to create the Application Insights component. | string      | yes      | NA      |
| tags                | A mapping of tags to assign to the resource.                                          | string      | no       | {}      |
| location            | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created| string      | no       | null    |
| app_insights_config | Specifies the Application Insight configuration                                       | map(object) | yes      | NA      |

`app_insights_config` block helps you setup the event grid subscription and accept following Keys

| Name | Description                                           | Type    | Required | Default |
| ---- |-------------------------------------------------------|---------|----|---------|
| application_type | Specifies the type of Application Insights to create. | string  | yes | NA      |
| wksp_sku | Specifies the SKU of the Log Analytics Workspace      | string  | yes | NA      |
| daily_data_cap_in_gb | Specifies the Application Insights component daily data volume cap in GB | string  | no | NA      |
| daily_data_cap_notification_disabled | Specifies if a notification email will be send when the daily data volume cap is met | boolean | no | NA      |
| retention_in_days | Specifies the retention period in days | number  | no | NA      |
| sampling_percentage | Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry | number  | no | NA      |
| disable_ip_masking | By default the real client IP is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client IP | bool    | no | false   |
