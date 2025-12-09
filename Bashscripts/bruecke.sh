#!/bin/bash

CONN1="bridge-br0"
CONN2="bridge-slave-enp5s0"

if [ -z "$CONN1" ] || [ -z "$CONN2" ]; then
    echo "Usage: $0 <connection1> <connection2>"
    exit 1
fi

# Check if either connection is active
ACTIVE1=$(nmcli -t -f NAME connection show --active | grep -Fx "$CONN1")
ACTIVE2=$(nmcli -t -f NAME connection show --active | grep -Fx "$CONN2")

if [ -n "$ACTIVE1" ] || [ -n "$ACTIVE2" ]; then
    echo "At least one connection is active. Turning BOTH OFF..."
    nmcli connection down "$CONN1" 2>/dev/null
    nmcli connection down "$CONN2" 2>/dev/null
else
    echo "Both connections are inactive. Turning BOTH ON..."
    nmcli connection up "$CONN1"
    nmcli connection up "$CONN2"
fi
