#!/bin/bash
name=`whoami`
S1=`ps -u $name|grep hft`
S2=""
if [ "$S1" == "$S2" ];
then
echo "Server NOT running...    "
else
echo "Please ENTER y to STOP or n to Keep it Running..."
read ans
if [ "$ans" == "y" ]
then
pkill hft
echo "Server STOPPED..."
fi
fi

