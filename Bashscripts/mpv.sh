#!/bin/bash
read -p "Link: " huh
mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --shuffle --volume=24 $huh
YTMPV=$(pgrep -f 'mpv --vo=null')

if pgrep -f 'alacritty --class mpvy' > /dev/null;then
	echo "$YTMPV"
fi




