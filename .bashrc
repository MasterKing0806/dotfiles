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

#Wenn der Monat nicht neu ist, soll "n" eingetippt werden. Dadurch wird vermieden, dass ein Ordner erstellt wird, welcher bereits existiert.
#Zunächst einmal eingeben lassen, welchen Name der Monatsordner hat/haben soll und dann Datum der Erstellung der Listen eingeben
einlesen (){
	read -p "Nicht vergessen, externe Backup-HDD anzuschließen! " filler
	read -p "Neuer Monat?(n für nein, ja egal was eintippen): " confirm
	read -p "Monat für Ordner eingeben (jjjj-mm-Monat): " monad
	read -p "Datum eingeben(tt.mm.jj): " tag
}

#peckage fragt ab, ob die drei Paketlisten -pacman, aur, flatpak- erstellt werden sollen, oder nicht. Damit wird vermieden, dass doppelte Listen erstellt werden.
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

#autosnap soll peckage zusammenführen mit anderen Prozessen. 
#doom upgrade updatet Doom Emacs. 
#confconf added, commited und pushed alle relevaten config files in Github.
#Ausserdem wird ein timeshift snapshot auf der externen Backup-HDD erstellt und jene Festplatte anschließend sicher ausgeworfen.
autosnap (){
	peckage
	doom upgrade
	confconf
	sudo timeshift --create
	udisk
	echo "Externe Backup-HDD sicher ausgeworfen, Backups wurden übertragen"
}

#Alles zusammenführen in eine übergreifende Funktion
#Falls confirm gleich n ist, also kein neuer Monat ist, dann läuft autosnap mit den beiden Prompts.
#Andernfalls, geschieht das gleiche, nur dass zusätzlich auf der externen Seagate-HDD ein Email-Ordner erstellt wird mit der neuen Monatsbezeichnung.
ueber (){
	einlesen
	if [ "$confirm"  == "n" ]; then
		autosnap
		read -p "Anschließen von externer Seagate-HDD " VARI1
		read -p "Linux-Infos, Google Notes, Emails und Studium Daten auf externe Seagate-HDD und dann sicher auswerfen? " VARI2
	else 
		autosnap
		read -p "Anschließen von externer Seagate-HDD " VARI1
		read -p "Linux-Infos, Google Notes, Emails und Studium Daten auf externe Seagate-HDD und dann sicher auswerfen? " VARI2
		mkdir /run/media/ca/Seagate/Email/$monad
	fi
	#Erstellung eines Emailordners in Abhängigkeit vom Monat sowie des Tages, an dem die Emails übertragen worden.
	mkdir /run/media/ca/Seagate/Email/$monad/$tag
	#Sychronisierung von Linux-Pakte Ordner sowie email mit externern Seagate-HDD
	rsync -ruvt  /games/canh/Linux-Pakte/ /run/media/ca/Seagate/Linux-Pakte	
	rsync -ruvt  /games/canh/email/ /run/media/ca/Seagate/Email/$monad/$tag
	read -p "Linux-Infos, Google Notes und Emails übertragen, fortfahren mit Studium-Daten (Vorsicht: Möglicher Datenverlust) " VARI6
	rsync -ruvtn /games/canh/Studium/ /run/media/ca/Seagate/Studium 
	#Dryrun der Kopie von Daten des Studiums, um sicher zu gehen
	read -p "Check: Sieht okay aus? Dann einfach fortfahren " VARI7
	#Sychronisierung von Studium Ordner mit Seagate-HDD
	rsync -ruvt --progress  /games/canh/Studium/ /run/media/ca/Seagate/Studium 
	sudo udisksctl unmount -b /dev/sdc2
	sudo udisksctl power-off -b /dev/sdc2
	echo "Linux-Infos, Google Notes, Emails übertragen und Studium-Daten, Seagate-HDD ausgeworfen "
	read -p "Manuell Daten übertragen von externer Seagate-HDD auf Ipad " VARI3
	#Übertragung von Ipad-Dateien auf PC über die externe Seagate-HDD
	read -p "Anschließen externer Seagate-HDD, um Ipad Dateien zu übertragen " VARI4
	rsync -ruvtn  /run/media/ca/Seagate/Studium/ /games/canh/Studium  
	read -p "Check: Sieht okay aus? Dann einfach fortfahren " VARI8
	rsync -ruvt --progress /run/media/ca/Seagate/Studium/ /games/canh/Studium  
	sudo udisksctl unmount -b /dev/sdc2
	sudo udisksctl power-off -b /dev/sdc2
	echo "Neue Ipad-Dateien und Goodnotes übertragen, Seagate-HDD ausgeworfen "
	fullupdate
}

alias snap='ueber' 


neofetch
