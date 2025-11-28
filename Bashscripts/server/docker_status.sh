#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Trap Ctrl+C (SIGINT) and exit immediately
trap 'echo -e "\nScript interrupted! Exiting..."; exit 1' SIGINT

mapfile -t files < <(find /home/caca/ -type f -name "compose.yaml")
#echo "${files[0]}"   # first file
for file in "${files[@]}"; do
     docker compose -f "$file" ps | awk -v f="$first" '
        NR==1 { 
            if(f==1) print   # Print header only for first file
            next
        } 
        { print }'
done

