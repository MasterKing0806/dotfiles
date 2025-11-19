#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/ca/dotfiles/ --work-tree=/home/ca'


#Aliases


alias doom='~/.emacs.d/bin/doom'

alias cum='cmatrix'

alias vpn='systemctl restart NetworkManager'

alias pps='sudo pacman -S'

alias pp='sudo pacman -Syu'

alias ppr='sudo pacman -Rsn'

alias ppq='pacman -Qi'

alias ja='yay -Sua'

alias flap='flatpak update'

alias clearclip='clipman clear --all'

alias ytmp3='yt-dlp -x --audio-format mp3'

alias rwaybar='waybar & disown'

alias bashrc='vim ~/.bashrc'

alias swayc='vim ~/.config/sway/config'

alias shut='shutdown now'

alias mpvyt='mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --shuffle --volume=24'  

alias mpvytnomix='mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --volume=24'  

alias ufotoserver='/home/ca/Bashscripts/ufotoserver.sh'

alias hyprc='vim ~/.config/hypr/hyprland.conf'

alias bashpr='vim ~/.bash_profile'

alias sus='/home/ca/Bashscripts/bashrc/suspend.sh'

alias bios='systemctl reboot --firmware-setup'

alias msianaus='hyprctl dispatch dpms toggle DP-2'

alias lganaus='hyprctl dispatch dpms toggle DP-1'

alias heimat='/home/ca/Bashscripts/fotoserverzuhause.sh'

alias sshlap='ssh caca@192.168.90.41'


#VDPAU (Video acceleration)
export VDPAU_DRIVER=radeonsi


#Funktionen

#Cache leeren
source /home/ca/Bashscripts/bashrc/cacheleer

#Komplettes Systemupdate über alle Packagemanager
source /home/ca/Bashscripts/bashrc/fullupdate

#Externen Backup-HDD entfernen
source /home/ca/Bashscripts/bashrc/udisk

#Automatisch Dotfiles in git repository pushen
source ~/Bashscripts/bashrc/confconf

#Automatisch Dotfiles löschen von repository Einträgen
source /home/ca/Bashscripts/bashrc/confrm

#Commands für Backuppen
#Löschen von Snapshots vereinfachen
source /home/ca/Bashscripts/bashrc/dtime

#Wichtige config files separat speichern
source /home/ca/Bashscripts/bashrc/kon

#Paketlisten erstellen
source /home/ca/Bashscripts/bashrc/peckage

#autosnap soll peckage zusammenführen mit anderen Prozessen.
#doom upgrade updatet Doom Emacs. 
#konf, config files zu separat zu speichern
#confconf added, commited und pushed alle relevaten config files in Github.
#Ausserdem wird ein timeshift snapshot auf der externen Backup-HDD erstellt und jene Festplatte anschließend sicher ausgeworfen.

source /home/ca/Bashscripts/bashrc/autosnap

#Alles zusammenführen in eine übergreifende Funktion
source /home/ca/Bashscripts/bashrc/snap


#neofetch
fastfetch  

#Starship
eval "$(starship init bash)"

# Source - https://superuser.com/a
# Posted by ingkebil, modified by community. See post 'Timeline' for change history
# Retrieved 2025-11-19, License - CC BY-SA 3.0


# Created by `pipx` on 2023-10-17 21:16:29
export PATH="$PATH:/home/ca/.local/bin"
