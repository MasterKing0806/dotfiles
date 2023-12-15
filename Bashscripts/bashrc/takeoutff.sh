#!/bin/bash
AUTO=$(hyprctl clients | grep firefox)

ggfs(){

if [[ "$AUTO" == *"firefox"* ]]; then
        firefox https://drive.google.com/drive/folders/1H3yzQRfY5beDW4rXad_qpUpDYbTPx3I0

else
        firefox --new-window https://drive.google.com/drive/folders/1H3yzQRfY5beDW4rXad_qpUpDYbTPx3I0
fi


}
ggfs
take(){

if [[ "$AUTO" == *"firefox"* ]]; then
        firefox https://takeout.google.com/

else
        firefox --new-window https://takeout.google.com/
fi


}
take

