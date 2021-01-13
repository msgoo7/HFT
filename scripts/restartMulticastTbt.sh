#!/bin/bash
mkdir -p tbtReplayFeed/

cp -R tbtRecordedFeed/* tbtReplayFeed/.

name=`whoami`
S1=`ps -u $name|grep multicastTbt`
S2=""
if [ "$S1" == "$S2" ];
then
  ./runMulticast.sh > /dev/null 2>&1 & disown
  echo "Multicast Tbt STARTED..  "
else
  echo "Multicast Tbt already running please enter y to restart or n to keep it
  running...    "
  read ans
  if [ "$ans" == "y" ]
  then
    pkill  multicastTbt
    ./runMulticast.sh > /dev/null 2>&1 & disown
    echo "Multicast Tbt RESTARTED. You need to restart HFT server as well. "
  else
    echo "Old instance is running..."
  fi
fi

