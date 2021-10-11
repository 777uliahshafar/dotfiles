#!/usr/bin/env bash

cd /Volumes/hdd/sttblog

git add .

DATE=$(date '+%Y-%m-%d %H:%M')

git commit -m "content of $DATE"

git push origin master

git push cpanel master

osascript -e "display notification 'pushed to remote' with title 'SUCCESS'"
