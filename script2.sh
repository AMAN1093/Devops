#!/bin/bash

echo "=============================="
echo "  SYSTEM INVENTORY REPORT"
echo "=============================="

# Hostname
echo -e "\n Hostname: $(hostname)"

# IP Address (IPv4)
ip_address=$(hostname -I | awk '{print $1}')
echo " IP Address: $ip_address"

# CPU Model
cpu_model=$(grep -m 1 "model name" /proc/cpuinfo | cut -d ':' -f2 | sed 's/^ //')
echo " CPU Model: $cpu_model"

# Total Memory
total_mem=$(free -h | awk '/^Mem:/ {print $2}')
echo " Total Memory: $total_mem"

# Disk Usage
echo -e "\n Disk Usage:"
df -h --total | grep -E 'Filesystem|total'

echo -e "\n Report generated on: $(date)"

