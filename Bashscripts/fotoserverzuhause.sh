#!/bin/bash
target=$(nmcli con show --active | grep -i "VPN Zuhause")
if [[ -z $target ]];then
    nmcli con up id "VPN Zuhause"
    mount /fotoserver/ca
elif [[ -n $target ]];then
    sudo umount /fotoserver/ca
    nmcli con down id "VPN Zuhause"
fi
