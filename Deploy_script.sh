#!/bin/bash

whoami
w
BACKUPTIME=`date +%b-%d-%y`
SOURCEFOLDER=/release/internal.utradesolutions.com/nidhika.bhardwaj/1.7.0.EMDI
HOSTNAME=10.0.0.12
USERNAME=sqpoint
PASSWORD=testpass
DATABASE=sqtestdb
source countdown.sh
echo "current working dirctory: $PWD"

countdown 10 "for server to stop "
$SOURCEFOLDER/stopServer.sh
$SOURCEFOLDER/stopDms.sh
echo "stopped"

mkdir ~/Backup-$BACKUPTIME

echo "Taking backup of current built"
countdown 5 "for backup to complete "
cp -r $SOURCEFOLDER/hft $SOURCEFOLDER/dms $SOURCEFOLDER/genConfirmations  $SOURCEFOLDER/librms.so ~/Backup-$BACKUPTIME/
echo "backup completed"

export PGPASSWORD="$PASSWORD"
pg_dump -F t -h $HOSTNAME -U $USERNAME $DATABASE > $(date +%Y-%m-%d).backup
#pg_dump -U $USERNAME $DATABASE > ~/Backup-$BACKUPTIME/dump-$BACKUPTIME.sql
unset PGPASSWORD

echo "Deployment starting"
sleep 2
echo "Deployment in progress"
echo "========================================================================"
countdown 5 "for package getting deployed "
cp -r $PWD/hft $PWD/dms $PWD/genConfirmations $PWD/librms.so $SOURCEFOLDER/
echo "package Deployed succesfully"

echo "Checking for migration"
$PWD/scripts/flywayDb/flyway info
$PWD/scripts/flywayDb/flyway migrate
$PWD/scripts/flywayDb/flyway info

sleep 2
echo "==========================================================================="
echo " deployment succesfull "
echo "==========================================================================="

echo "Updated Package are: "
ls -ltr $SOURCEFOLDER | tail -4 "
sleep 2
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
