#!/bin/bash

read -p "Sway [1] oder Hyprland [2]? " auswahl
if [ $auswahl = 1 ]; then
	rm /home/ca/.config/waybar/config
	rm /home/ca/.config/waybar/style.css
	cp /home/ca/.config/waybar/waybar_sway/config /home/ca/.config/waybar
	cp /home/ca/.config/waybar/waybar_sway/style.css /home/ca/.config/waybar
	exec sway
else
	rm /home/ca/.config/waybar/config
	rm /home/ca/.config/waybar/style.css
	cp /home/ca/.config/waybar/waybar_hypr/config /home/ca/.config/waybar
	cp /home/ca/.config/waybar/waybar_hypr/style.css /home/ca/.config/waybar
	exec Hyprland
fi

