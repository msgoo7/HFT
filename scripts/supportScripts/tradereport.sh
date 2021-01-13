#!/bin/bash


SCRIPT_PATH=`pwd`

SEARCHPATH=/root/muTradeInstaller/muTrade-1.0.0-Linux

cd  $SEARCHPATH

# It will run genConfirmation and will generate confirmations.csv

./genConfirmations

# Here we will fetch confirmed order & trade

Order=`cat confirmations.csv | cut -d ',' -f5,6 | grep '1,' | sort -t: -u -k1,1 |wc -l`

Trade=`cat confirmations.csv | cut -d ',' -f5,6 | grep '2,' | sort -t: -u -k1,1 |wc -l`

# This will write the trades & order in the output file

echo Order $Order > order_trade_$(date +%d-%m-%Y-%T).txt

echo Trade $Trade >> order_trade_$(date +%d-%m-%Y-%T).txt