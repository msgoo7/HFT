#!/bin/bash
./genConfirmations
mv confirmations.csv confirmations$(date +%d%h%y_%H_%M_%S).csv
