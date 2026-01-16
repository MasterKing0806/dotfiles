#!/bin/bash
AUTO=$(hyprctl clients | grep firefox)

ggfs(){

if [[ "$AUTO" == *"firefox"* ]]; then
         
        # Grdrive
        #firefox https://drive.google.com/drive/folders/1H3yzQRfY5beDW4rXad_qpUpDYbTPx3I0

        #firefox https://takeout.google.com/
        read -p "Sync Joplin " JOP1
        firefox http://192.168.90.23:8080/login
    
else
        # Gdrive
        #firefox --new-tab -url https://drive.google.com/drive/folders/1H3yzQRfY5beDW4rXad_qpUpDYbTPx3I0 --new-tab -url https://takeout.google.com/

        read -p "Sync Joplin " JOP2
        firefox --new-tab -url http://192.168.90.23:8080/login
fi


}
ggfs
