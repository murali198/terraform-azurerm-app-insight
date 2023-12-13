resource "azurerm_log_analytics_workspace" "app_insight_wksp" {
  for_each            = var.app_insights_config != null ? var.app_insights_config : {}
  name                = "${each.key}-wksp"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = each.value["wksp_sku"]
  retention_in_days   = each.value["retention_in_days"]
  tags                = var.tags
}

resource "azurerm_application_insights" "app_insight" {
  for_each                              = var.app_insights_config != null ? var.app_insights_config : {}
  name                                  = each.key
  location                              = var.location
  resource_group_name                   = var.rg_name
  application_type                      = each.value["application_type"]
  daily_data_cap_in_gb                  = each.value["daily_data_cap_in_gb"]
  daily_data_cap_notifications_disabled = each.value["daily_data_cap_notification_disabled"]
  retention_in_days                     = each.value["retention_in_days"]
  sampling_percentage                   = each.value["sampling_percentage"]
  disable_ip_masking                    = each.value["disable_ip_masking"]
  workspace_id                          = azurerm_log_analytics_workspace.app_insight_wksp[each.key].id
  tags                                  = var.tags
}
