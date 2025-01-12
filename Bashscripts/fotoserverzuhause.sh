#!/bin/bash
target=$(nmcli con show --active | grep -i "VPN Zuhause")
if [[ -z $target ]];then
    nmcli con up id "VPN Zuhause"
    mount /fotoserver
elif [[ -n $target ]];then
    sudo umount /fotoserver
    nmcli con down id "VPN Zuhause"
fi
