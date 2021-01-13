#!/bin/bash
cd logs/dmsLogs/
tail -n 500 -f `ls -rt|grep dms | tail -n 1`
