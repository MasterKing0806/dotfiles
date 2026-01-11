#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Trap Ctrl+C (SIGINT) and exit immediately
trap 'echo -e "\nScript interrupted! Exiting..."; exit 1' SIGINT

mapfile -t files < <(sudo find /home/caca/ -type f -name "compose.yaml")
#echo "${files[0]}"   # first file
for file in "${files[@]}"; do
     echo "Stopping containers in $file"
     docker compose -f "$file" stop 
done

#Turn off external drive before shutting down
sudo udisksctl unmount -b /dev/sdb
sudo udisksctl power-off -b /dev/sdb
echo "Externe Festplatte ist aus"

echo "shutting down"
sudo shutdown -h now
