pswd="mutrade"
username="mutrade"
dbName="testuser_mutrade_hft"

PGPASSWORD=$pswd pg_dump -U $username $dbName -t clientcode_grossexposurelimit -t clientcode_grossexposuresecuritywiselimit -t clientcode_orderlimits -t dealerid_grossexposurelimit -t dealerid_grossexposuresecuritywiselimit -t SecurityWise_Limit > orderLimitBackup_${dbName}_${username}_$(date +%m_%d_%y_%H_%M_%S).sql 
