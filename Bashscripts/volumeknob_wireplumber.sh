 #!/bin/bash


 SPOTIFY_INDEX=$(
wpctl status | awk '
/^[[:space:]]*[0-9]+\. spotify[[:space:]]+\[.*pid:[0-9]+\]/ {
    match($0, /pid:([0-9]+)/, a)
    print a[1]
}'
)

FEISHIN_INDEX=$(
wpctl status | awk '
/^[[:space:]]*[0-9]+\. Chromium[[:space:]]+\[.*pid:[0-9]+\]/ {
    match($0, /pid:([0-9]+)/, a)
    print a[1]
}'
)

YTMPV=$(pgrep -f 'mpv --vo=null')

if pgrep -f "/usr/bin/feishin" > /dev/null; then
    echo "$FEISHIN_INDEX"
elif pgrep -f /opt/spotify > /dev/null;then
    echo "$SPOTIFY_INDEX"
elif pgrep -f 'alacritty --class mpvy' > /dev/null;then
	echo "$YTMPV"
fi
 
