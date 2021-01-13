#!/bin/bash
name=`whoami`
S1=`ps -u $name|grep mcl`
S2=""
if [ "$S1" == "$S2" ];
then
  echo "mcl NOT running..."
else
  echo "mcl is RUNNING...    "
fi
