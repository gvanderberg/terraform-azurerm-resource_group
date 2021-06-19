output "this" {
  value = element(coalescelist(azurerm_resource_group.this.*, data.azurerm_resource_group.this.*), 0)
}
