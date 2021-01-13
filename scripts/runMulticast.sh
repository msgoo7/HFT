#!/bin/bash
rm -f /dev/shm/SHM-TBT-NSE*
./multicastTbt 2>&1|tee ./logs/hftLogs/multicastLog_$(date +%d%h%y_%H_%M_%S).txt
