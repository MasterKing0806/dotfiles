#
# ~/.bash_profile
#

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    source Bashscripts/wayland.sh
#   exec sway
#   exec Hyprland	 	
fi


[[ -f ~/.bashrc ]] && . ~/.bashrc
