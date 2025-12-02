#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Aliases

source /home/ca/.bash_aliases

#Functions
source /home/ca/.bash_functions

#VDPAU (Video acceleration)
export VDPAU_DRIVER=radeonsi

#neofetch
fastfetch  

#Starship
eval "$(starship init bash)"

# Source - https://superuser.com/a
# Posted by ingkebil, modified by community. See post 'Timeline' for change history
# Retrieved 2025-11-19, License - CC BY-SA 3.0


# Created by `pipx` on 2023-10-17 21:16:29
export PATH="$PATH:/home/ca/.local/bin"
