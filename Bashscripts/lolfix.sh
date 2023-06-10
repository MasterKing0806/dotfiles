#!/bin/bash



# set the expected x position of the monitor by your preference
expect_y=1540
# index 0 is the first monitor in your hyprland.conf
curr_y=$(hyprctl -j monitors | jq '.[0].y') 
if [ $curr_y -ne $expect_y ]
then
    hyprctl keyword monitor DP-1,2560x1440@165,0x${expect_y},1
else
    expect_y=$(($expect_y - 100))
    hyprctl keyword monitor DP-1,2560x1440@165,0x${expect_y},1
fi
