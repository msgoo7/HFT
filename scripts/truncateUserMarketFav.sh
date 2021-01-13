#!/bin/bash
pswd="mutrade"
database_name="mutradedb"
username="mutrade"
PGPASSWORD=$pswd psql -d $database_name -U $username -c "TRUNCATE user_market_fav;"
