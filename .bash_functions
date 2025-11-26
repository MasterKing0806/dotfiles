#Funktionen

#autosnap soll peckage zusammenführen mit anderen Prozessen.
#doom upgrade updatet Doom Emacs. 
#konf, config files zu separat zu speichern
#confconf added, commited und pushed alle relevaten config files in Github.
#Ausserdem wird ein timeshift snapshot auf der externen Backup-HDD erstellt und jene Festplatte anschließend sicher ausgeworfen.

source /home/ca/Bashscripts/bashrc/autosnap

#Cache leeren
source /home/ca/Bashscripts/bashrc/cacheleer

#Automatisch Dotfiles in git repository pushen
source ~/Bashscripts/bashrc/confconf

#Automatisch Dotfiles löschen von repository Einträgen
source /home/ca/Bashscripts/bashrc/confrm

#Löschen von Snapshots vereinfachen
source /home/ca/Bashscripts/bashrc/dtime

#Komplettes Systemupdate über alle Packagemanager
source /home/ca/Bashscripts/bashrc/fullupdate

#Wichtige config files separat speichern
source /home/ca/Bashscripts/bashrc/kon

#Paketlisten erstellen
source /home/ca/Bashscripts/bashrc/peckage

#ssh Backup
source /home/ca/Bashscripts/bashrc/ssh_backup 

#Alles zusammenführen in eine übergreifende Funktion
source /home/ca/Bashscripts/bashrc/snap

#Externen Backup-HDD entfernen
source /home/ca/Bashscripts/bashrc/udisk

#Zuhause VPN Datenübertragung
source /home/ca/Bashscripts/bashrc/zuhausesnap

