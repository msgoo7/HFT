#!/bin/bash
name=`whoami`
S1=`ps -u $name|grep multicastTbt`
S2=""
if [ "$S1" == "$S2" ];
then
  echo "Multicast Client NOT running..."
else
  echo "Multicast Client is RUNNING...    "
fi

