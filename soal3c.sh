#!/bin/bash

grep "Location" wget.log > location.log

for xxx in {1..28}
do
for zzz in {1..28}
do
if [ $xxx -eq $zzz ]
	then
	continue
elif cmp -s "pdkt_kusuma_$xxx" "pdkt_kusuma_$zzz"
	then
	mv pdkt_kusuma_$xxx ./duplicate/duplicate_$xxx
	fi
done
done

for xxx in {1..28}
do
	mv pdkt_kusuma_$xxx ./kenangan/kenangan_$xxx
done
cp wget.log wget.log.bak
