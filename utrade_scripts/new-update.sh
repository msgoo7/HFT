#!/bin/bash

LOG_FILE=/tmp/update-$(date +%b-%d-%y-%H-%M).log
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
echo "Checking for old tar file"
sleep 2
if [ -e HFT_ENABLE_NEW_RMS_Deploy.tar ]
then
 echo "File present, moving to old"
 mv HFT_ENABLE_NEW_RMS_Deploy.tar HFT_ENABLE_NEW_RMS_Deploy.tar.old
else
 echo "All Good"
 echo "======================================="
fi

sleep 2

echo "Fetching the latest Build"
echo "####################################################"
BACKUPTIME=`date +%b-%d-%y`

#curl -u Squarepoint:UrF/3Zeesw0O -O ftp://time.utradesolutions.com/SquarePoint-Deploy/HFT_ENABLE_NEW_RMS_Deploy.tar
wget --user=Squarepoint --password=UrF/3Zeesw0O ftp://time.utradesolutions.com/SquarePoint-Deploy/HFT_ENABLE_NEW_RMS_Deploy.tar

tar xvf HFT_ENABLE_NEW_RMS_Deploy.tar

if [ -e HFT_ENABLE_NEW_RMS_Deploy ]
then
 echo "Package Fetched"
else
 echo "Package not found, Please check. "
 echo "======================================="
 exit
fi

sleep 2
rm -rf HFT_ENABLE_NEW_RMS_Deploy.tar

echo $PWD >> $PWD/info_files.txt
cat $PWD/utrade.conf | grep '^host' | awk -F "=" '{print $2}' >> $PWD/info_files.txt
cat $PWD/utrade.conf | grep '^user' | awk -F "=" '{print $2}' >> $PWD/info_files.txt
cat $PWD/utrade.conf | grep '^dbname' | awk -F "=" '{print $2}' >> $PWD/info_files.txt
cat $PWD/utrade.conf | grep '^port' | awk -F "=" '{print $2}' >> $PWD/info_files.txt
cat $PWD/utrade.conf | grep '^password' | awk -F "=" '{print $2}' >> $PWD/info_files.txt
 
echo "starting update"

cp -r $PWD/info_files.txt $PWD/HFT_ENABLE_NEW_RMS_Deploy/HFT_*/

cd $PWD/HFT_ENABLE_NEW_RMS_Deploy/HFT_*
echo $PWD
./Deploy_script.sh
cp -r $PWD/rollback.sh ~/Backup-$BACKUPTIME/scripts/
cd ../..
echo $PWD
#cp -r $PWD/HFT_ENABLE_NEW_RMS_Deploy/rollback.sh ~/Backup-$BACKUPTIME/scripts/
echo "cleanup in progress"
progress
rm -rf $PWD/HFT_ENABLE_NEW_RMS_Deploy
rm -rf $PWD/info_files.txt

echo "cleanup completed"
} | tee "${LOG_FILE}"
