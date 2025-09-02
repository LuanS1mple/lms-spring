#!/bin/bash

# Chờ SQL Server sẵn sàng (loop kiểm tra)
echo "Waiting for SQL Server to start..."
until /opt/mssql-tools/bin/sqlcmd -S sql-server -U sa -P "$DB_PWD" -Q "SELECT 1" &> /dev/null
do
  echo -n "."
  sleep 2
done

echo "SQL Server is up, running init.sql"
/opt/mssql-tools/bin/sqlcmd -S sql-server -U sa -P "$DB_PWD" -d master -i /docker-entrypoint-initdb.d/init.sql

echo "All done!"
