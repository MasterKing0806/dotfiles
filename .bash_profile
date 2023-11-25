#
# ~/.bash_profile
#

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#    source Bashscripts/wayland.sh
#    source Bashscripts/swaylogin.sh
    source Bashscripts/hyprlandlogin.sh
fi


[[ -f ~/.bashrc ]] && . ~/.bashrc

# Created by `pipx` on 2023-10-17 21:16:29
export PATH="$PATH:/home/ca/.local/bin"
