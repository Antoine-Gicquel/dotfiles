#!/bin/bash

sleep 15
data=$(qvm-run --dispvm dvm-debian-11 --pass-io "timeout 10 curl wttr.in/?format=3 2>/dev/null" | awk -F':' '{ print $2}')
data_shortened=$(echo $data | sed -e 's/ //g')
echo $data_shortened
