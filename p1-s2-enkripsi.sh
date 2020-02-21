#!/bin/bash

lower='abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
upper='ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ'
filename=$(echo $1 | grep -oP '.*(?=\.txt)')
hour=$(date +%-H)
rename=$(echo $filename | tr ${lower:0:26}${upper:0:26} ${lower:$hour:26}${upper:$hour:26})
mv $1 $rename".txt"
