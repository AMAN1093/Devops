#!/bin/bash

# CSV input file
FILE="iter.csv"

# Check if the file exists
if [[ ! -f "$FILE" ]]; then
    echo "File '$FILE' not found!"
    exit 1
fi

echo "NAME      | MARKS | ADDRESS"
echo "-----------------------------"

# Process the CSV
tail -n +2 "$FILE" | while IFS=',' read -r name regd sem marks address; do
    # Remove leading/trailing spaces using sed
    name=$(echo "$name" | sed 's/^ *//;s/ *$//')
    marks=$(echo "$marks" | sed 's/^ *//;s/ *$//')
    address=$(echo "$address" | sed 's/^ *//;s/ *$//')

    # Format output
    printf "%-9s | %-5s | %s\n" "$name" "$marks" "$address"
done

