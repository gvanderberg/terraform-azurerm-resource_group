data "azurerm_resource_group" "this" {
  count = var.resource_group_create ? 0 : 1

  name = var.resource_group_name
}

resource "azurerm_resource_group" "this" {
  count = var.resource_group_create ? 1 : 0

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_management_lock" "this" {
  count = var.management_lock_create ? 1 : 0

  name       = "can-not-delete-lock"
  scope      = azurerm_resource_group.this[count.index].id
  lock_level = "CanNotDelete"

  depends_on = [azurerm_resource_group.this]
}
