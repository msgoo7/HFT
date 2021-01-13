connectionType=$1
connectionPort=$2
algoEngineId=$3

name=`whoami`
S1=`ps -u $name|grep dms`
S2=""
if [ "$S1" == "$S2" ];
then
  ./runDms.sh > /dev/null 2>&1 & disown
  echo "DMS STARTED..  "
else
  echo "DMS already running please enter y to restart or n to keep it running...    "
  read ans
  if [ "$ans" == "y" ]
  then
    pkill dms
    ./runDms.sh > /dev/null 2>&1 & disown
    echo "DMS RESTARTED..  "
  else
    echo "Old instance is running..."
  fi
fi
