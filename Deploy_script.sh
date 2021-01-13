#!/bin/bash

whoami
w
BACKUPTIME=`date +%b-%d-%y`
SOURCEFOLDER=/root/muTrade-1.0.0-Linux-I2-DC
source countdown.sh
echo "current working dirctory: $PWD"

countdown 10 "for server to stop "
echo "stopped"

mkdir ~/Backup-$BACKUPTIME

echo "Taking backup of current built"
countdown 5 "for backup to complete "
cp -r $SOURCEFOLDER/hft $SOURCEFOLDER/dms $SOURCEFOLDER/genConfirmations  $SOURCEFOLDER/librms.so ~/Backup-$BACKUPTIME/
echo "backup completed"


pg_dump -U mutrade spoint > ~/Backup-$BACKUPTIME/dump-$BACKUPTIME.sql

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
