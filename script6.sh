#!/bin/bash
services=("ssh" "cron" "mysql" "nginx")  
echo "Checking service status..."
for service in "${services[@]}"; do
    if systemctl list-units --type=service --all | grep -q "$service.service"; then
        if systemctl is-active --quiet "$service"; then
            echo "$service is ACTIVE "
        else
            echo "$service is INACTIVE "
        fi
    else
        echo "$service service NOT FOUND "
    fi
done

