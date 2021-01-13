#!/bin/bash
name=`whoami`
S1=`ps -u $name|grep dms`
S2=""
if [ "$S1" == "$S2" ];
then
  echo "DMS NOT running...    "
else
  echo "Please ENTER y to STOP or n to Keep it Running..."
  read ans
  if [ "$ans" == "y" ]
  then
    pkill dms
    echo "DMS STOPPED..."
  fi
fi
