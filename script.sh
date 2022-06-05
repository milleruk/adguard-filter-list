#!/bin/bash

cd /home/adguard-filter-list

# Create compiled blocklist
#time /usr/local/bin/hostlist-compiler -v -c hostlist-compiler-config.json -o blocklist

# Date and time
currentDate=`/bin/date '+%Y-%m-%d'`
currentTime=`/bin/date '+%H:%M:%S'`

# Push it to GitHub
git add *
git commit -m "Blocklist update ${currentDate} ${currentTime}"
git push
