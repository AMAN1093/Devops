#!/bin/bash


usage=$(df / | awk 'NR==2 {gsub("%", "", $5); print $5}')

echo " Current disk usage of / partition: $usage%"


if [ "$usage" -gt 80 ]; then
    echo " ALERT: Disk usage is above 80%!"
else
    echo " Disk usage is under control."
fi

