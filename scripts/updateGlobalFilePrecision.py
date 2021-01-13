#!/usr/bin/env python
import sys

s = sys.stdin.readline().strip().split()
l = [12,13,15,17]
#The loop will take each line and will substitute each number at the afformentioned places by multiplying the same with 100.
while ( True ):
  s = sys.stdin.readline().strip().split(',')
  if s[0] == '':   break;
  for i in l:
    s[i-1] = str( int(s[i-1]) * 100 )

  print ','.join(s)

