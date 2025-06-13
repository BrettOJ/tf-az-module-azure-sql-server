resource "azurerm_resource_group" "example" {
  name     = "database-rg"
  location = "West Europe"
}

module "azure_sql_server" {
    source = "../modules/azure_sql_server"
    name                         = var.name
    resource_group_name          = var.resource_group_name
    location                     = var.location
    version                      = var.version
    administrator_login          = var.administrator_login
    administrator_login_password = var.administrator_login_password != null ? var.administrator_login_password : var.administrator_login_password_wo
    connection_policy            = var.connection_policy
    minimum_tls_version          = var.minimum_tls_version
    public_network_access_enabled = var.public_network_access_enabled
    outbound_network_restriction_enabled = var.outbound_network_restriction_enabled
    transparent_data_encryption_key_vault_key_id = var.transparent_data_encryption_key_vault_key_id
    primary_user_assigned_identity_id = var.primary_user_assigned_identity_id
    tags = var.tags
    
    identity = {
        type         = var.identity_type
        identity_ids = var.identity_ids
    }
    
    azuread_administrator = {
        login_username              = var.azuread_administrator_login_username
        object_id                   = var.azuread_administrator_object_id
        tenant_id                   = var.azuread_administrator_tenant_id
        azuread_authentication_only = var.azuread_administrator_azuread_authentication_only
    }
}
