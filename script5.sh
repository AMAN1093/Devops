#!/bin/bash


LOGFILE="./mylog.log"

# Check if log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Log file '$LOGFILE' not found!"
    exit 1
fi

echo "Lines with 'error' in $LOGFILE:"
echo "-----------------------------------"

# Print line number and matching line
grep -n "error" "$LOGFILE" | awk -F: '{print "Line " $1 ": " $2}'

