#!/bin/bash

DIR="./" 
LOGFILE="deleted_logs_$(date +%F).txt"
echo "Deleting .log files older than 7 days in $DIR..."
find "$DIR" -type f -name "*.log" -mtime +7 -print -exec rm {} \; | tee "$LOGFILE"

echo " Cleanup complete. Log saved to $LOGFILE."

