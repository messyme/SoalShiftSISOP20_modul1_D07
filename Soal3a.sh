#!/bin/bash
for xxx in {1..28}
do
	wget "https://loremflickr.com/320/240/cat" -O "/home/davtang/pdkt_kusuma_$xxx" -a "/home/davtang/wget.log"
done


