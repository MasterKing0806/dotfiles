#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/ca/dotfiles/ --work-tree=/home/ca'





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

#Cache leeren
leer () {
	read -p "Cache leeren? (ja y, sonst egal) " LOO
	if [ "$LOO" = "y" ];then
		flatpak uninstall --unused
		sudo pacman -Rsn $(pacman -Qqtd)
		yay -Sc
	fi
}

alias cacheleer='leer'


#Komplettes Systemupdate über alle Packagemanager
sysalles () {
	read -p "Komplettes Systemupdate! Hast du alles gebackupped?(y für ja; Achtung bei Yay Git Packages CleanBuild) " VAR1
	if [ "$VAR1" = "y" ]; then
	    pp
	    ja
	    flap
	    pipx upgrade-all
	fi
}
alias fullupdate='sysalles'

alias bashrc='vim ~/.bashrc'

alias swayc='vim ~/.config/sway/config'

alias shut='shutdown now'

alias .config='~/.config'

alias mpvyt='mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --shuffle --volume=24'  

alias mpvytnomix='mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --volume=24'  

alias ufotoserver='sudo umount -l /fotoserver'

#alias mov-cli='/home/ca/.local/bin/mov-cli'

alias hyprc='vim ~/.config/hypr/hyprland.conf'



#VDPAU (Video acceleration)
export VDPAU_DRIVER=radeonsi





#Externen Backup-HDD entfernen
unmounten  (){
		sudo udisksctl unmount -b /dev/sdd1
		sudo udisksctl power-off -b /dev/sdd1
}


alias udisk='unmounten'

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
#Falls confirm gleich n ist, also kein neuer Monat ist, dann läuft autosnap mit den beiden Prompts.
#Andernfalls, geschieht das gleiche, nur dass zusätzlich auf der externen Seagate-HDD ein Email-Ordner erstellt wird mit der neuen Monatsbezeichnung.
ueber (){
	einlesen
	if [ "$confirm"  == "n" ]; then
		autosnap
		read -p "Google Takout erstellen" CARI1
		read -p "Linux-Infos, Google Notes, Emails, Handy Fotos, Wallpaper, Keepass, etc. und Studium Daten auf externe Seagate-HDD und dann sicher auswerfen? " VARI2
	else 
		autosnap
		read -p "Google Takout erstellen" CARI1
		read -p "Linux-Infos, Google Notes, Emails, Handy Fotos, Wallpaper, Keepass, etc. und Studium Daten auf externe Seagate-HDD und dann sicher auswerfen? " VARI2
		mkdir /run/media/ca/7FEF-CE8E/Email/$monad
	fi
	#Erstellung eines Emailordners in Abhängigkeit vom Monat sowie des Tages, an dem die Emails übertragen worden.
	mkdir /run/media/ca/7FEF-CE8E/Email/$monad/$tag
	#Sychronisierung von Linux-Pakte Ordner, email, Handy Fotos, Wallpaper, Keepass, Beleg, Filme-Serien, Kontoauszug, Musik, screenshots, Word-Dokumente, Lol, novus-bevo mit externern Seagate-HDD
	rsync -ruvt  /games/canh/Linux-Pakte/ /run/media/ca/7FEF-CE8E/Linux-Pakte	
	rsync -ruvt  /games/canh/email/ /run/media/ca/7FEF-CE8E/Email/$monad/$tag
	rsync -ruvt "/games/canh/Fotos Galaxy s9/" "/run/media/ca/7FEF-CE8E/Fotos Galaxy s9"
	rsync -ruvt /games/canh/Wallpapers/ /run/media/ca/7FEF-CE8E/Wallpapers
	rsync -ruvt  /games/canh/KeePass.kdbx /run/media/ca/7FEF-CE8E/Keepass
	rsync -ruvt  /games/canh/Beleg/ /run/media/ca/7FEF-CE8E/Beleg
	rsync -ruvt  /games/canh/Filme-Serien/ /run/media/ca/7FEF-CE8E/Filme-Serien
	rsync -ruvt  /games/canh/Kontoauszug/ /run/media/ca/7FEF-CE8E/Kontoauszug
	rsync -ruvt  /games/canh/Musik/ /run/media/ca/7FEF-CE8E/Musik
	rsync -ruvt  /games/canh/screenshots/ /run/media/ca/7FEF-CE8E/screenshots
	rsync -ruvt  /games/canh/Schule/ /run/media/ca/7FEF-CE8E/Schule
	rsync -ruvt  /games/canh/Word-Dokumente/ /run/media/ca/7FEF-CE8E/Word-Dokumente
	rsync -ruvt  /games/canh/Lol/ /run/media/ca/7FEF-CE8E/Lol
	rsync -ruvt  /kingston/Minecraft-alles/ /run/media/ca/7FEF-CE8E/Minecraft
	read -p "Linux-Infos, Google Notes, Emails, Handy Fotos, Wallpaper und Keepass, etc. übertragen, fortfahren mit Studium-Daten (Vorsicht: Möglicher Datenverlust). Bitte erste alle Studium-Daten mit Learnweb vergleichen. " VARI6
	read -p "Über Cloud Daten zwischen Ipad und PC austauschen sowie Daten auf Ipad mit PC manuell synchronisieren " luxky
	rsync -ruvtn /games/canh/Studium/ /run/media/ca/7FEF-CE8E/Studium 
	#Dryrun der Kopie von Daten des Studiums, um sicher zu gehen
	read -p "Check: Sieht okay aus? Dann einfach fortfahren " VARI7
	#Sychronisierung von Studium Ordner mit Seagate-HDD
	rsync -ruvt --progress  /games/canh/Studium/ /run/media/ca/7FEF-CE8E/Studium 
	read -p "Externe Seagate-HDD auswerfen?(am besten kurz warten) " VARI10
	sudo udisksctl unmount -b /dev/sdc1
	sudo udisksctl power-off -b /dev/sdc1
	echo "Linux-Infos, Google Notes, Emails, Handy Fotos, Wallpaper, Keepass übertragen, etc. und Studium-Daten, Seagate-HDD ausgeworfen "
	read -p "Linux-Pakte und Studium Ordner auf Fotoserver übertragen. " jkl
	rsync -ruvt --exclude '/Config Files/Wichtige Config Files/WebCord' /games/canh/Linux-Pakte/ "/fotoserver/fotos/Canh PC/Linux-Pakte"
	rsync -ruvt  /games/canh/Kontoauszug/ "/fotoserver/fotos/Canh PC/Kontoauszug"
	rsync -ruvtn --progress --exclude={'*.mp4*','*.mp3*','*.zip*'} /games/canh/Studium/ "/fotoserver/fotos/Canh PC/Studium"
	read -p "Sieht aus okay aus? Dann einfach weiter. " jkl1
	rsync -ruvt --progress --exclude={'*.mp4*','*.mp3*','*.zip*'} /games/canh/Studium/ "/fotoserver/fotos/Canh PC/Studium"
	fullupdate
	cacheleer
}

alias snap='ueber' 


neofetch

# Created by `pipx` on 2023-10-17 21:16:29
export PATH="$PATH:/home/ca/.local/bin"
