#Funktionen
#Hier alle Skripte aus dem ~/Bashscripts/bashrc mit source einfügen, da sonst die Funktionen nicht erkannt werden können


#autosnap soll peckage zusammenführen mit anderen Prozessen.
#doom upgrade updatet Doom Emacs. 
#konf, config files zu separat zu speichern
#confconf added, commited und pushed alle relevaten config files in Github.
#Ausserdem wird ein timeshift snapshot auf der externen Backup-HDD erstellt und jene Festplatte anschließend sicher ausgeworfen.

source /home/ca/Bashscripts/bashrc/autosnap

#Cache leeren
source /home/ca/Bashscripts/bashrc/cacheleer

#Automatisch Dotfiles in git repository pushen
source /home/ca/Bashscripts/bashrc/confconf

#Automatisch Dotfiles löschen von repository Einträgen
source /home/ca/Bashscripts/bashrc/confrm

#Löschen von Snapshots vereinfachen
source /home/ca/Bashscripts/bashrc/dtime

#Komplettes Systemupdate über alle Packagemanager
source /home/ca/Bashscripts/bashrc/fullupdate

#Wichtige config files separat speichern
source /home/ca/Bashscripts/bashrc/kon

#Wichtige Files backuppen
source /home/ca/Bashscripts/bashrc/mediasnap

#Neuer Monat
#source /home/ca/Bashscripts/bashrc/neuermonat

#Paketlisten erstellen
source /home/ca/Bashscripts/bashrc/peckage

#Alles zusammenführen in eine übergreifende Funktion
source /home/ca/Bashscripts/bashrc/snap

#ssh Backup
source /home/ca/Bashscripts/bashrc/ssh_backup 

#Externen Backup-HDD entfernen
source /home/ca/Bashscripts/bashrc/udisk

#Wake on Lan Alias (dont want it in my git)
source /home/ca/Bashscripts/bashrc/wol

#Zuhause VPN Datenübertragung
source /home/ca/Bashscripts/bashrc/zuhausesnap

