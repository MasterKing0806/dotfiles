#!/bin/bash

status=$(curl -s -o /dev/null -w "%{http_code}" http:///admin/login)

if [[ "$status" == "200" || "$status" == "302" ]]; then
    echo "Pi-hole is online"
else
    echo "Pi-hole is offline"

    #Set Quad9 as DNS
    nmcli  connection modify "Wired connection 2" ipv4.dns "1.1.1.1 8.8.8.8"

    nmcli  connection modify "Wired connection 2" ipv6.dns "2001:4860:4860::8888 2001:4860:4860::8844"
fi

