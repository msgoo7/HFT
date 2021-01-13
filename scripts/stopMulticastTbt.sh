#!/bin/bash
name=`whoami`
S1=`ps -u $name|grep multicastTbt`
S2=""
if [ "$S1" == "$S2" ];
then
  echo "Multicast Tbt NOT running...    "
else
  echo "Please ENTER y to STOP or n to Keep it Running..."
  read ans
  if [ "$ans" == "y" ]
  then
    pkill  multicastTbt
    echo "Multicast Tbt STOPPED..."
  fi
fi

