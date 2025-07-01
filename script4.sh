#!/bin/bash

echo "=============================="
echo " USER HOME DIRECTORY CHECK"
echo "=============================="

# Read each line from /etc/passwd
while IFS=: read -r username _ _ _ _ home_dir _; do
    # Only check users with home directories under /home or /root
    if [[ "$home_dir" == /home/* || "$home_dir" == "/root" ]]; then
        if [ -d "$home_dir" ]; then
            echo " $username: Home directory '$home_dir' exists."
        else
            echo " $username: Home directory '$home_dir' does NOT exist!"
        fi
    fi
done < /etc/passwd
