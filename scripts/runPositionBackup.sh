mkdir -p logs/positionBackup
./positionBackup 2>&1|tee ./logs/positionBackup/positionBackupLogs_$(date +%d%h%y_%H_%M_%S).txt
