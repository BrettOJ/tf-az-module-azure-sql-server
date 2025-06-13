resource "azurerm_mssql_server" "azure_sql_server" {
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

    dynamic "identity" {
        for_each = var.identity != null ? [var.identity] : []
        content {
            type         = identity.value.type
            identity_ids = lookup(identity.value, "identity_ids", null)
        }
    }

    dynamic "azuread_administrator" {
        for_each = var.azuread_administrator != null ? [var.azuread_administrator] : []
        content {
            login_username              = azuread_administrator.value.login_username
            object_id                   = azuread_administrator.value.object_id
            tenant_id                   = lookup(azuread_administrator.value, "tenant_id", null)
            azuread_authentication_only = lookup(azuread_administrator.value, "azuread_authentication_only", null)
        }
    }
}

