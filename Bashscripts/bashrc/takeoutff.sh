#!/bin/bash
AUTO=$(hyprctl clients | grep firefox)

take(){

if [[ "$AUTO" == *"firefox"* ]]; then
        firefox https://takeout.google.com/

else
        firefox --new-window https://takeout.google.com/
fi


}
take
