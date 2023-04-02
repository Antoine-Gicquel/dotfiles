#!/bin/sh

count=$(qvm-ls --no-spinner --raw-data --fields FLAGS 2>/dev/null | grep -v "^0" | grep "^.r...." | wc -l)
echo " $count"
