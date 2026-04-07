#!/bin/bash
if ! systemctl --user is-active --quiet sunshine; then
	cp /home/ca/.config/hypr/sunshine/hyprland_sunshine.conf /home/ca/.config/hypr/hyprland.conf
    hyprctl output create headless DP-3
    systemctl --user start sunshine
    hyprctl dispatch dpms toggle DP-2
    hyprctl dispatch dpms toggle DP-1
else
	cp /home/ca/.config/hypr/sunshine/hyprland_og.conf /home/ca/.config/hypr/hyprland.conf
    systemctl --user stop sunshine
    hyprctl output destroy DP-3
    hyprctl reload
    hyprctl dispatch dpms toggle DP-2
    hyprctl dispatch dpms toggle DP-1
fi
