#!/bin/bash
#
# 2020/10/25, borchen
#
# ./upload.sh
#

git add -A
git commit -m `date +%Y%m%d`
git push origin main
