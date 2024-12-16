#!/bin/bash


# Navigate to blocklist directory
cd /opt/data || { echo "Directory not found: ./data/blocklist/"; exit 1; }

# Download the oisd.txt file
oisd_url="https://big.oisd.nl"
oisd_file="oisd.txt"

echo "Downloading oisd.txt from $oisd_url..."
wget -q -O $oisd_file $oisd_url


# Verify the download
if [[ $? -ne 0 || ! -f $oisd_file ]]; then
  echo "Error: Failed to download oisd.txt from $oisd_url"
  exit 1
else
  echo "Successfully downloaded $oisd_file"
fi

cd /opt/adguard-filter-list

# Create compiled blocklist
time /usr/local/bin/hostlist-compiler -v -c hostlist-compiler-config.json -o blocklist

# Date and time
currentDate=`/bin/date '+%Y-%m-%d'`
currentTime=`/bin/date '+%H:%M:%S'`

# Push it to GitHub
#git add *
#git commit -m "Blocklist update ${currentDate} ${currentTime}"
#git push
