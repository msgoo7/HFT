#!/bin/bash
name=`whoami`
S1=`ps -u $name|grep hft`
S2=""
if [ "$S1" == "$S2" ];
then
echo "Server NOT running..."
else
echo "Server is RUNNING...    "
fi
