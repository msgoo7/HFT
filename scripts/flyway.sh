cd flywayDb
pswd="mutrade"
PGPASSWORD=$pswd pg_dump -U mutrade mutradedb -f pg_dump_$(date +%d%h%y_%H_%M_%S).sql
./flyway migrate
