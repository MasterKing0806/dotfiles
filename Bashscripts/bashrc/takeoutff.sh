#!/bin/bash
AUTO=$(hyprctl clients | grep firefox)

ggfs(){

if [[ "$AUTO" == *"firefox"* ]]; then
        firefox https://drive.google.com/drive/folders/1H3yzQRfY5beDW4rXad_qpUpDYbTPx3I0

        firefox https://takeout.google.com/
else
        firefox --new-tab -url https://drive.google.com/drive/folders/1H3yzQRfY5beDW4rXad_qpUpDYbTPx3I0 --new-tab -url https://takeout.google.com/
fi


}
ggfs
