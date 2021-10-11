#!/usr/bin/env bash
# Copyright 2021 Happy Coder
# Exit immediately if   one fails
set -eu

cd /Volumes/hdd/sttblog

gatsby build

git add .

DATE=$(date '+%Y-%m-%d %H:%M')

git commit -m "content of $DATE"

git push origin master

git push cpanel master

osascript -e "display notification 'pushed to remote' with title 'SUCCESS'"
