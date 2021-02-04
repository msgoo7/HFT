#!/bin/bash

#set -x

LOG_FILE=/tmp/Rollback-$(date +%b-%d-%y-%H-%M).log

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

{
echo -e "script to rollback the updated build\n"

echo -e  "############################################################"

echo $PWD

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
echo " Your PORT is: $PORT "
echo " Your Password is: $PASSWORD "


sleep 2

while true; do
    read -p "Are you sure to rollback the changes? || Please enter Y/y to continue || Please enter N/n to exit" yn
    case $yn in
         [Yy]* ) cp -r ~/Backup-$BACKUPTIME/hft ~/Backup-$BACKUPTIME/dms ~/Backup-$BACKUPTIME/genConfirmations ~/Backup-$BACKUPTIME/librms.so ~/Backup-$BACKUPTIME/fileUploader $SOURCEFOLDER/; break;;
         [Nn]* ) exit;;
         * ) echo "Please choose correct option";;
    esac
done


echo "checking for server, stoping the server if running"
progress
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

export PGPASSWORD="$PASSWORD"
echo "restoring database"
progress
/usr/pgsql-11/bin/dropdb -U $USERNAME -p $PORT $DATABASE

/usr/pgsql-11/bin/createdb -U $USERNAME -p $PORT $DATABASE

psql -U $USERNAME -d $DATABASE -h $HOSTNAME -p $PORT < ~/Backup-$BACKUPTIME/dump-$BACKUPTIME.sql 

unset PGPASSWORD

~/Backup-$BACKUPTIME/scripts/flywayDb/flyway info
echo "rollback completed"
} | tee "${LOG_FILE}"
