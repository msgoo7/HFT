#!/bin/bash
mkdir -p ./logs/dmsLogs
./dms 2>&1|tee ./logs/dmsLogs/dmsLog_$(date +%d%h%y_%H_%M_%S).txt
