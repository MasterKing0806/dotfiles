#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/ca/dotfiles/ --work-tree=/home/ca'



alias lol="sudo sh -c 'sysctl -w abi.vsyscall32=0'"

alias spss='/home/ca/spss/bin/statistics'

alias doom='~/.emacs.d/bin/doom'

alias cum='cmatrix'

alias pps='sudo pacman -S'

alias pp='sudo pacman -Syu'

alias ja='yay -Sua'

alias bashrc='vim ~/.bashrc'

alias swayc='vim ~/.config/sway/config'

alias shut='shutdown now'

alias .config='~/.config'
