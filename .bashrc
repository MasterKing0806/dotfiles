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

alias flap='flatpak update'

#Komplettes Systemupdate über alle Packagemanager
sysalles () {
	read -p "Komplettes Systemupdate! Hast du alles gebackupped?(y für ja) " VAR1
	if [ "$VAR1" = "y" ]; then
	    pp
	    ja
	    flap
	fi
}
alias fullupdate='sysalles'

alias bashrc='vim ~/.bashrc'

alias swayc='vim ~/.config/sway/config'

alias shut='shutdown now'

alias .config='~/.config'

#Timeshift gtk App öffnen
timer (){
	xhost +
	sudo timeshift-gtk
}

alias timeshifts='timer'

#Externen Backup-HDD entfernen
unmounten  (){
	sudo udisksctl unmount -b /dev/sdc1
	sudo udisksctl power-off -b /dev/sdc1
}


alias udisk='unmounten'

alias sdmmr='systemctl restart sddm'

#Commands für Backuppen
#Löschen von Snapshots vereinfachen
timedelete (){
	sudo timeshift --list
	read -p "Eingabe von Snapshot: " name
	sudo rm -r $name
}

alias dtime='timedelete'

#Paketliste und Snapshots erstellen automatisieren
#Zunächst einmal eingeben lassen, welchen Name der Monatsordner hat/haben soll und dann Datum der Erstellung der Listen eingeben
einlesen (){
	read -p "Monat für Ordner eingeben (jjjj-mm-Monat): " monad
	read -p "Datum eingeben(tt.mm.jj): " tag
}

#Erstellen von den ganzen Listen plus ausführen von Timeshift backup
autosnap (){
	mkdir /games/canh/Linux-Pakte/Paketliste/$monad/$tag
	pacman -Qqen > /games/canh/Linux-Pakte/Paketliste/$monad/$tag/$tag-pkglist.txt
	pacman -Qqem > /games/canh/Linux-Pakte/Paketliste/$monad/$tag/$tag-aurpkglist.txt
	flatpak list > /games/canh/Linux-Pakte/Paketliste/$monad/$tag/$tag-flat.txt
#	sudo timeshift --create
#	udisk
}

#Alles zusammenführen in eine übergreifende Funktion
ueber (){
	read -p "Neuer Monat?(n für nein, ja egal was eintippen): " confirm
	einlesen
	if [ "$confirm"  == "n" ]; then
		autosnap
	else 
		mkdir /games/canh/Linux-Pakte/Paketliste/$monad
		autosnap
	fi

}

alias snap='ueber' 



neofetch
