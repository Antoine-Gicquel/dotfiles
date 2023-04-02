#!/bin/bash

amixer_id=$(amixer controls | grep "Capture Switch" | grep -Eo 'numid=[0-9]+' | awk -F'=' '{ print $2 }')
mic_status=$(amixer cget numid=$amixer_id | grep "values=o" | awk -F',' '{ print $2 }')

if [ $mic_status == "off" ]; then
    mic_off=''
    echo $mic_off
else
    mic_volume=$(pactl list sources | grep -A 10 -E '^\s*Name:.*analog-stereo$' | grep -E '^\s*Volume' | awk -F'/' '{ print $2 }' | xargs)
    mic_on=" $mic_volume"
    echo $mic_on
fi
