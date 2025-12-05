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

echo "Stopping Docker daemon."
sudo systemctl stop docker

echo "Updating Arch"
sudo pacman -Syu

echo "Starting Docker daemon."
sudo systemctl start docker

for file in "${files[@]}"; do
     echo "Starting contrainers in $file"
     docker compose -f "$file" start
done

echo "Docker update and all compose projects restarted successfully."
