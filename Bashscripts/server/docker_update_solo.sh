#!/bin/bash

echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting update"
mapfile -t files < <(sudo find /home/caca/ -type f -name "compose.yaml")
#echo "${files[0]}"   # first file
for file in "${files[@]}"; do
     echo "Stopping containers in $file"
     docker compose -f "$file" down
done

for file in "${files[@]}"; do
     echo "Pulling containers in $file"
     docker compose -f "$file" pull
done

for file in "${files[@]}"; do
     echo "Starting contrainers in $file"
     docker compose -f "$file" up -d
done

echo "Docker update and all compose projects restarted successfully."
