#!/bin/bash

# Check if auth.log exists
LOGFILE="/var/log/auth.log"
if [[ ! -f $LOGFILE ]]; then
    echo "Log file $LOGFILE not found!"
    exit 1
fi

echo "Successful SSH Login Attempts (Username & Timestamp):"
echo "-----------------------------------------------------"

# Extract successful login entries and display unique username + timestamp
grep "Accepted" "$LOGFILE" | grep "ssh" | awk '{print $1, $2, $3, $9}' | sort | uniq

