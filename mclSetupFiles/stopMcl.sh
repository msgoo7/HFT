#!/bin/bash
name=`whoami`
S1=`ps -u $name|grep mcl`
S2=""
if [ "$S1" == "$S2" ];
then
  echo "Mcl NOT running...    "
else
  echo "Please ENTER y to STOP or n to Keep it Running..."
  read ans
  if [ "$ans" == "y" ]
  then
    pkill mcl
    echo "Mcl STOPPED..."
  fi
fi

