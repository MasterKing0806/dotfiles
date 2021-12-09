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

alias vpn='systemctl restart NetworkManager'

jun(){
	watch -n.1 "grep \"^[c]pu MHz\" /proc/cpuinfo"
}

alias freq='jun'

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

#Automatisch in git repository pushen

hubby2 (){
	read -p "Update Nachricht für commit: " updaten
	config add .doom.d
	#config add .mozilla
	config add .bashrc
	config add .phoronix-test-suite
	config add .thunderbird
	config add .config/alacritty
	config add .config/sway
	config add .config/mpd
	config add .config/fontconfig
	config add .config/gtk-2.0
	config add .config/gtk-3.0
	config add .config/htop
	config add .config/Kvantum
	config add .config/libreoffice
	config add .config/mpv
	config add .config/qt5ct
	config add .config/radeon-profile
	config add .config/retroarch
	config add .config/waybar
	config add .config/environment.d
	config commit -m "$updaten"
	config push
}
alias confconf='hubby2'

#Automatisch löschen von repository Einträgen
hubby (){
	read -p "Wie viele Einträge sollen gelöscht werden? " zahlen
	for ((c=1; c<=$zahlen; c++)) 
	do
		read -p "Zu löschender Git-Eintrag(k für keine): " eint
		if [ $eint == k ] ;then
			exit
		else
			config rm -r --cached $eint
		fi
	done
	config commit -m "löschen von $eint"
	config push
}

alias confrm='hubby'


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
	read -p "Nicht vergessen, externe Backup-HDD anzuschließen! " filler
	read -p "Neuer Monat?(n für nein, ja egal was eintippen): " confirm
	read -p "Monat für Ordner eingeben (jjjj-mm-Monat): " monad
	read -p "Datum eingeben(tt.mm.jj): " tag
}

#Erstellen von den ganzen Listen plus ausführen von Timeshift backup

peckage() {
	read -p "Neue Paketliste erstellen? (n für nein, sonst egal was) " juck
	if [ "$juck" == "n" ];then
		echo "Es wurden keine Paketelisten erstellt"
	else
		if [ "$confirm" != "n" ];then
			mkdir /games/canh/Linux-Pakte/Paketliste/$monad
		fi
		mkdir /games/canh/Linux-Pakte/Paketliste/$monad/$tag
		pacman -Qqen > /games/canh/Linux-Pakte/Paketliste/$monad/$tag/$tag-pkglist.txt
		pacman -Qqem > /games/canh/Linux-Pakte/Paketliste/$monad/$tag/$tag-aurpkglist.txt
		flatpak list > /games/canh/Linux-Pakte/Paketliste/$monad/$tag/$tag-flat.txt
		echo "Paketlisten wurden erstellt "
	fi
}

autosnap (){
	peckage
	confconf
	doom update
	sudo timeshift --create
	udisk
}

#Alles zusammenführen in eine übergreifende Funktion
ueber (){
	einlesen
	if [ "$confirm"  == "n" ]; then
		autosnap
		read -p "Anschließen von externer Seagate-HDD und manuelles Übertragen von Studium Daten " VARI1
		read -p "Linux-Infos auf externe Seagate-HDD und dann sicher auswerfen? " VARI2
	else 
		autosnap
		read -p "Anschließen von externer Seagate-HDD und manuelles Übertragen von Studium Daten " VARI1
		read -p "Linux-Infos, Google Notes und Emails auf externe Seagate-HDD und dann sicher auswerfen? " VARI2
		mkdir /run/media/ca/Seagate/Email/$monad
	fi
	mkdir /run/media/ca/Seagate/Email/$monad/$tag
	rsync -ruvt  /games/canh/Linux-Pakte/ /run/media/ca/Seagate/Linux-Pakte	
	rsync -ruvt  /games/canh/email/ /run/media/ca/Seagate/Email/$monad/$tag
	sudo udisksctl unmount -b /dev/sdc2
	sudo udisksctl power-off -b /dev/sdc2
	echo "Linux-Infos, Google Notes und Emails übertragen, Seagate-HDD ausgeworfen "
	read -p "Manuell Daten übertragen von externer Seagate-HDD auf Ipad " VARI3
	read -p "Anschließen externer Seagate-HDD, um Ipad Dateien manuell zu übertragen " VARI4
	read -p "Goodnotes Backups auf Ipad übertragen " VARI5
	rsync -ruvt /run/media/ca/Seagate/Studium/Goodnotes/ /games/canh/Studium/Goodnotes  
	sudo udisksctl unmount -b /dev/sdc2
	sudo udisksctl power-off -b /dev/sdc2
	echo "Goodnotes übertragen, Seagate-HDD ausgeworfen "
	fullupdate
}

alias snap='ueber' 


neofetch
