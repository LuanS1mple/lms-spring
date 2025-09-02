#!/bin/bash
if /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$DB_PWD" -Q 'SELECT 1'; then
    exit 0
else
    exit 1
fi