#!/bin/bash

runMcl()
{
  mkdir -p logs/mclLogs
  mkdir -p AsyncTestLog/NCDEX
  ./mcl > ./logs/mclLogs/mclLog_$(date +%d%h%y_%H_%M_%S).txt 2>&1 &
}

name=`whoami`
S1=`ps -u $name|grep mcl`
S2=""
if [ "$S1" == "$S2" ];
then
  runMcl
  echo "MCL STARTED..  "
else
  echo "MCL already running please enter y to restart or n to keep it running...    "
  read ans
  if [ "$ans" == "y" ]
  then
    pkill mcl
    runMcl
    echo "MCL RESTARTED..  "
  else
    echo "Old instance is running..."
  fi
fi

