#!/bin/bash

read -p "Sway [1] oder Hyprland [2]? " auswahl
if [ $auswahl = 1 ]; then
	rm /home/ca/.config/waybar/config
	rm /home/ca/.config/waybar/style.css
	cp /home/ca/.config/waybar/waybar_sway/config /home/ca/.config/waybar
	cp /home/ca/.config/waybar/waybar_sway/style.css /home/ca/.config/waybar
	rm "/home/ca/.config/lutris/games/league-of-legends-standard-launch-help-1647964793.yml" 
	cp "/kingston/lutris/lol_yml/lol_sway/league-of-legends-standard-launch-help-1647964793.yml" "/home/ca/.config/lutris/games"
	exec sway
else
	rm /home/ca/.config/waybar/config
	rm /home/ca/.config/waybar/style.css
	cp /home/ca/.config/waybar/waybar_hypr/config /home/ca/.config/waybar
	cp /home/ca/.config/waybar/waybar_hypr/style.css /home/ca/.config/waybar
	rm "/home/ca/.config/lutris/games/league-of-legends-standard-launch-help-1647964793.yml" 
	cp "/kingston/lutris/lol_yml/lol_hypr/league-of-legends-standard-launch-help-1647964793.yml" "/home/ca/.config/lutris/games"
	exec Hyprland
fi

