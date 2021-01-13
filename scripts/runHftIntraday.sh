#!/bin/bash

rm logs/exchangeLogs/sgx/partition-2-SGX-GLIMPSE-SEQNUM.txt
rm logs/exchangeLogs/sgx/partition-1-SGX-GLIMPSE-SEQNUM.txt

./hft 2>&1|tee  ./logs/hftLogs/hftLog_$(date +%d%h%y_%H_%M_%S).txt
