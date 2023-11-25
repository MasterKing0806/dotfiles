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

alias lolan="/home/ca/Bashscripts/lolfix.sh"

alias ytmp3='yt-dlp -x --audio-format mp3'

alias rwaybar='waybar & disown'

alias bashrc='vim ~/.bashrc'

alias swayc='vim ~/.config/sway/config'

alias shut='shutdown now'

alias .config='~/.config'

alias mpvyt='mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --shuffle --volume=24'  

alias mpvytnomix='mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --volume=24'  

alias ufotoserver='sudo umount -l /fotoserver'

#alias mov-cli='/home/ca/.local/bin/mov-cli'

alias hyprc='vim ~/.config/hypr/hyprland.conf'

alias shortcuts='echo "$(</home/ca/Bashscripts/bashfunctions.txt)"'

#Disable Howdy Warnings
export OPENCV_LOG_LEVEL=0
export OPENCV_VIDEOIO_PRIORITY_INTEL_MFX=0

#VDPAU (Video acceleration)
export VDPAU_DRIVER=radeonsi


#Funktionen

#Cache leeren
source /home/ca/Bashscripts/cacheleer

#Komplettes Systemupdate über alle Packagemanager
source /home/ca/Bashscripts/fullupdate

#Externen Backup-HDD entfernen
source /home/ca/Bashscripts/udisk

#Automatisch Dotfiles in git repository pushen
source ~/Bashscripts/confconf

#Automatisch Dotfiles löschen von repository Einträgen
source /home/ca/Bashscripts/confrm

#Commands für Backuppen
#Löschen von Snapshots vereinfachen
source /home/ca/Bashscripts/dtime

#Wichtige config files separat speichern
source /home/ca/Bashscripts/kon

#Paketlisten erstellen
source /home/ca/Bashscripts/peckage

#autosnap soll peckage zusammenführen mit anderen Prozessen.
#doom upgrade updatet Doom Emacs. 
#konf, config files zu separat zu speichern
#confconf added, commited und pushed alle relevaten config files in Github.
#Ausserdem wird ein timeshift snapshot auf der externen Backup-HDD erstellt und jene Festplatte anschließend sicher ausgeworfen.

source /home/ca/Bashscripts/autosnap

#Alles zusammenführen in eine übergreifende Funktion
source /home/ca/Bashscripts/snap




neofetch

# Created by `pipx` on 2023-10-17 21:16:29
export PATH="$PATH:/home/ca/.local/bin"
