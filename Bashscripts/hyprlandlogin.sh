#!/bin/bash
	rm /home/ca/.config/waybar/config
	rm /home/ca/.config/waybar/style.css
	cp /home/ca/.config/waybar/waybar_hypr/config /home/ca/.config/waybar
	cp /home/ca/.config/waybar/waybar_hypr/style.css /home/ca/.config/waybar
	exec start-hyprland
