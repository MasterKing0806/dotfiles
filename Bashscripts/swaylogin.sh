#!/bin/bash
	rm /home/ca/.config/waybar/config
	rm /home/ca/.config/waybar/style.css
	cp /home/ca/.config/waybar/waybar_sway/config /home/ca/.config/waybar
	cp /home/ca/.config/waybar/waybar_sway/style.css /home/ca/.config/waybar
	exec sway

