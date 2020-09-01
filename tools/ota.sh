#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2020 Saurabh Charde <saurabhchardereal@gmail.com>
#
RED="$(printf '\033[31m')"
END="$(printf '\033[0m')"

[[ -z "$ANDROID_PRODUCT_OUT" ]] && echo ${RED}"LUNCH your device first!"${END} && return 1 &> /dev/null

# fetch basic info
DEVICE=$(echo "$ANDROID_PRODUCT_OUT" | sed 's/.*product\///')
ZIPFILE=$(ls "$ANDROID_PRODUCT_OUT" | grep -E "ColtOS-v.*.-${DEVICE}-.*.zip$")

# check if the builder has built ColtOS successfully
[[ -z "$ZIPFILE" ]] && \
echo ${RED}"Plox run script after you've successfully built ColtOS!"${END} && \
return 1 &> /dev/null


# proceed after finding $ZIPFILE
TIMESTAMP=$(cat "$ANDROID_PRODUCT_OUT"/system/build.prop | grep 'ro.build.date.utc' | cut -d'=' -f2)
MD5SUM=$(cat "$ANDROID_PRODUCT_OUT"/"$ZIPFILE".md5sum | awk '{print $1}')
SIZE=$(ls -l "$ANDROID_PRODUCT_OUT"/"$ZIPFILE" | awk '{print $5}')

# let's grep SF link from our ColtOS-Devices/README.md
SFLINK=$(curl -s https://raw.githubusercontent.com/ColtOS-Devices/official_devices/c10/README.md | \
grep -i ${DEVICE} | sed 's/.*\[Stable\]//' | \
awk -F"[()]" '{print $2}')
SOURCEFORGE=$(echo "${SFLINK}${ZIPFILE}/download")

cat > $DEVICE.json <<EOF
{
  "response": [
    {
        "filename": "$ZIPFILE",
        "url": "$SOURCEFORGE",
        "timestamp": $TIMESTAMP,
        "md5sum": "$MD5SUM",
        "size": $SIZE,
        "version": "10.0",
        "romtype": "Official"
    }
  ]
}
EOF
