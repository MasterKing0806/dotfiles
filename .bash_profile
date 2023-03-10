#
# ~/.bash_profile
#

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    source wayland.sh
#   exec sway
#   exec Hyprland	 	
fi


[[ -f ~/.bashrc ]] && . ~/.bashrc
