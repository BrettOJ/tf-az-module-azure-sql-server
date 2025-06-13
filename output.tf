output "azure_sql_server" {
    value       = azurerm_mssql_server.azure_sql_server
    description = "The Azure SQL Server resource created by this module."
}