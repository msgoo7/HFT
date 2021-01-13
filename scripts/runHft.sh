#!/bin/bash

#OLD sequence no. files shall be removed for a smooth restart of SGX-OUCH
#and GLIMPSE adapter
rm logs/exchangeLogs/sgx/partition-2-SGX-GLIMPSE-SEQNUM.txt
rm logs/exchangeLogs/sgx/partition-1-SGX-GLIMPSE-SEQNUM.txt
rm logs/exchangeLogs/sgx/family-1-SGX-OUCH-SEQNUM.txt
rm logs/exchangeLogs/sgx/family-2-SGX-OUCH-SEQNUM.txt

#File Upload Restart Behaviour
IS_SERVER_RESTART=1
./assembleSpanData.sh $IS_SERVER_RESTART

mkdir gtcGtdRecords/archiveGtcGtdRecords
mv gtcGtdRecords/* gtcGtdRecords/archiveGtcGtdRecords/
./orderFilter
d=archiveRecords/gtcGtdRecords$(date +%d%h%y_%H_%M_%S)
mkdir $d
mv gtcGtdRecords/archiveGtcGtdRecords $d/.

./flyway.sh
mkdir -p archiveRecords
d=archiveRecords/records$(date +%d%h%y_%H_%M_%S)
mkdir $d
mv records/* $d/.
tar -cvzf $d.tar.gz $d/*
rm -rf $d
mkdir -p archiveLogs
p=archiveLogs/logs$(date +%d%h%y_%H_%M_%S)
mkdir -p $p
mv logs/* $p/.
tar -cvzf $p.tar.gz $p/*
rm -rf $p
mkdir -p ./logs/strategyLogs
mkdir -p ./logs/hftLogs
mkdir -p ./logs/strategyParams
mkdir -p ./logs/exchangelogs
mkdir -p ./logs/dma
mkdir -p ./logs/rmsLogs
mkdir -p ./run
q=archiveLogs/run$(date +%d%h%y_%H_%M_%S)
mkdir -p $q
mv run/* $q/.
tar -cvzf $q.tar.gz $q/*
rm -rf $q
./hft $IS_SERVER_RESTART  2>&1|tee ./logs/hftLogs/hftLog_$(date +%d%h%y_%H_%M_%S).txt
