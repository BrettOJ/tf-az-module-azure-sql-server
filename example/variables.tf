
variable "name" {
    description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure."
    type        = string
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the Microsoft SQL Server."
    type        = string
}

variable "location" {
    description = "Specifies the supported Azure location where the resource exists."
    type        = string
}

variable "version" {
    description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
    type        = string
}

variable "administrator_login" {
    description = "The administrator login name for the new server."
    type        = string
    default     = null
}

variable "administrator_login_password" {
    description = "The password associated with the administrator_login user."
    type        = string
    sensitive   = true
    default     = null
}

variable "administrator_login_password_wo" {
    description = "The Password associated with the administrator_login user (write-only)."
    type        = string
    sensitive   = true
    default     = null
}

variable "administrator_login_password_wo_version" {
    description = "An integer value used to trigger an update for administrator_login_password_wo."
    type        = number
    default     = null
}

variable "connection_policy" {
    description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect."
    type        = string
    default     = "Default"
}

variable "express_vulnerability_assessment_enabled" {
    description = "Whether to enable the Express Vulnerability Assessment Configuration."
    type        = bool
    default     = false
}

variable "transparent_data_encryption_key_vault_key_id" {
    description = "The fully versioned Key Vault Key URL."
    type        = string
    default     = null
}

variable "minimum_tls_version" {
    description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server."
    type        = string
    default     = "1.2"
}

variable "public_network_access_enabled" {
    description = "Whether public network access is allowed for this server."
    type        = bool
    default     = true
}

variable "outbound_network_restriction_enabled" {
    description = "Whether outbound network traffic is restricted for this server."
    type        = bool
    default     = false
}

variable "primary_user_assigned_identity_id" {
    description = "The primary user assigned identity id."
    type        = string
    default     = null
}

variable "tags" {
    description = "A mapping of tags to assign to the resource."
    type        = map(string)
    default     = {}
}

variable "identity_type" {
    description = "The type of identity used for the SQL Server. Possible values are SystemAssigned, UserAssigned, or SystemAssigned, UserAssigned."
    type        = string
    default     = "SystemAssigned"
}

variable "identity_ids" {
    description = "A list of User Assigned Identity IDs to associate with the SQL Server."
    type        = list(string)
    default     = []
}


variable "azuread_administrator_login_username" {
    description = "An azuread_administrator block for Azure AD Administrator configuration."
    type        = string
    default     = null
}

variable "azuread_administrator_object_id" {
    description = "The object ID of the Azure AD administrator."
    type        = string
    default     = null
}

variable "azuread_administrator_tenant_id" {
    description = "The tenant ID of the Azure AD administrator."
    type        = string
    default     = null
}

variable "azuread_administrator_azuread_authentication_only" {
    description = "Whether the Azure AD administrator can only use Azure AD authentication."
    type        = bool
    default     = false
}

