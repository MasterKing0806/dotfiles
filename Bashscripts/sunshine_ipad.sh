#!/bin/bash
if ! systemctl --user is-active --quiet  app-dev.lizardbyte.app.Sunshine; then
	cp /home/ca/.config/hypr/sunshine/hyprland_sunshine.lua /home/ca/.config/hypr/hyprland.lua
    hyprctl output create headless DP-3
    systemctl --user start app-dev.lizardbyte.app.Sunshine
    sleep 30
    hyprctl dispatch 'hl.dsp.dpms({ action = "toggle", monitor = "DP-1" })'
    hyprctl dispatch 'hl.dsp.dpms({ action = "toggle", monitor = "DP-2" })'
else
	cp /home/ca/.config/hypr/sunshine/hyprland_og.lua /home/ca/.config/hypr/hyprland.lua
    systemctl --user stop app-dev.lizardbyte.app.Sunshine
    hyprctl output destroy DP-3
    hyprctl reload
    hyprctl dispatch 'hl.dsp.dpms({ action = "toggle", monitor = "DP-1" })'
    hyprctl dispatch 'hl.dsp.dpms({ action = "toggle", monitor = "DP-2" })'
fi
