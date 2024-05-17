#!/bin/bash
	source /home/ca/Bashscripts/bashrc/internalhddoff # to turn off internal hdd with windows on; remove when everything is on ssd
	rm /home/ca/.config/waybar/config
	rm /home/ca/.config/waybar/style.css
	cp /home/ca/.config/waybar/waybar_hypr/config /home/ca/.config/waybar
	cp /home/ca/.config/waybar/waybar_hypr/style.css /home/ca/.config/waybar
	exec Hyprland

