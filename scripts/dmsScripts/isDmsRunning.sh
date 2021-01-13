#!/bin/bash
name=`whoami`
S1=`ps -u $name|grep dms`
S2=""
if [ "$S1" == "$S2" ];
then
  echo "DMS NOT running..."
else
  echo "DMS is RUNNING..."
fi
