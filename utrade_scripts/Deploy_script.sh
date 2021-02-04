#!/bin/bash

#set -x

function progress {
    bar=''
    for (( x=0; x <= 100; x++ )); do
        sleep 0.05
        bar="${bar} "

        echo -ne "\r"
        echo -ne "\e[43m$bar\e[0m"

        local left="$(( 100 - $x ))"
        printf " %${left}s"
        echo -n "${x}%"
    done
    echo -e "\n"
}

whoami
w
BACKUPTIME=`date +%b-%d-%y`

SOURCEFOLDER=$(awk 'NR == 1 {print $1}' $PWD/info_files.txt)
HOSTNAME=$(awk 'NR == 2 {print $1}' $PWD/info_files.txt)
USERNAME=$(awk 'NR == 3 {print $1}' $PWD/info_files.txt)
DATABASE=$(awk 'NR == 4 {print $1}' $PWD/info_files.txt)
PORT=$(awk 'NR == 5 {print $1}' $PWD/info_files.txt)
PASSWORD=$(awk 'NR == 6 {print $1}' $PWD/info_files.txt)


echo " Your source folder is: $SOURCEFOLDER "
echo " Your Hostname for DB is: $HOSTNAME "
echo " Your Username for DB is: $USERNAME "
echo " Your DB name is: $DATABASE "
echo " Your Port is: $PORT "
echo " Your Password is: $PASSWORD "

sleep 5

#source countdown.sh
echo "current working dirctory: $PWD"

echo "checking for server, stoping the server if running"
progress
#countdown 10 "for server to stop "
#$SOURCEFOLDER/stopServer.sh y
#$SOURCEFOLDER/stopDms.sh y
name=`whoami`
S1=`ps -u $name|grep hft`
S2=""
if [ "$S1" == "$S2" ];
then
 echo "Server NOT running...    "
else
 pkill hft
 echo "Server STOPPED..."
fi

S3=`ps -u $name|grep dms`
S4=""
if [ "$S3" == "$S4" ];
then
  echo "DMS NOT running...    "
else
  pkill dms
  echo "DMS STOPPED..."
fi
echo "server successfully stopped"

mkdir ~/Backup-$BACKUPTIME

echo "Taking backup of current built"
#countdown 5 "for backup to complete "
progress
cp -r $SOURCEFOLDER/hft $SOURCEFOLDER/dms $SOURCEFOLDER/genConfirmations  $SOURCEFOLDER/librms.so $SOURCEFOLDER/fileUploader  ~/Backup-$BACKUPTIME/
cp -r $SOURCEFOLDER/config/params/params.conf ~/Backup-$BACKUPTIME/
#cp -r $PWD/scripts ~/Backup-$BACKUPTIME/

echo "taking postgresql backup"
progress
export PGPASSWORD="$PASSWORD"
#pg_dump -F t -h $HOSTNAME -p $PORT -U $USERNAME $DATABASE > ~/Backup-$BACKUPTIME/dump-$BACKUPTIME.sql
#pg_dump -U $USERNAME $DATABASE > ~/Backup-$BACKUPTIME/dump-$BACKUPTIME.sql
/usr/pgsql-11/bin/pg_dump -U $USERNAME -h $HOSTNAME -p $PORT -d $DATABASE > ~/Backup-$BACKUPTIME/dump-$BACKUPTIME.sql
unset PGPASSWORD
echo "backup completed"

#countdown 10 "for updating flayway config files "
echo "updating flayway config file"
progress
ex -s $PWD/scripts/flywayDb/conf/flyway.properties << END_CMDS
%s/flyway.url=/#flyway.url=
%s/flyway.password=/#flyway.password=
%s/flyway.user=/#flyway.user=
w!
q
END_CMDS

for i in $PWD/scripts/flywayDb/conf/flyway.properties ;do printf '%s\n' 0a 'flyway.url=jdbc:postgresql://'$HOSTNAME':'$PORT'/'$DATABASE'' 'flyway.user='$USERNAME'' 'flyway.password='$PASSWORD'' . x | ex "$i";done

echo "updation completed"

cp -r $PWD/scripts ~/Backup-$BACKUPTIME/
cp -r $PWD/info_files.txt ~/Backup-$BACKUPTIME/scripts/

echo "Deployment starting"
sleep 2
echo "Deployment in progress"
echo "========================================================================"
progress
#countdown 5 "for package getting deployed "
cp -r $PWD/hft $PWD/dms $PWD/genConfirmations $PWD/librms.so $PWD/fileUploader $SOURCEFOLDER/

echo "package Deployed succesfully"

echo "Checking for migration"
$PWD/scripts/flywayDb/flyway info
$PWD/scripts/flywayDb/flyway migrate
$PWD/scripts/flywayDb/flyway info
progress

echo "==========================================================================="
echo " deployment succesfull "
echo "==========================================================================="

echo "Updated Package are: "
ls -ltr $SOURCEFOLDER | tail -5
sleep 2
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
