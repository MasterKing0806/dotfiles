 #!/bin/bash


SPOTIFY_INDEX=$(
    pactl list sink-inputs | awk '
        /^Sink Input/ { gsub("#","",$3); idx=$3 }
        tolower($0) ~ /application.name = "spotify"/ { print idx }
    '
)

FEISHIN_INDEX=$(
    pactl list sink-inputs | awk '
        /^Sink Input/ { gsub("#","",$3); idx=$3 }
        tolower($0) ~ /application.name = "mpv"/ { print idx }
    '
)

if pactl list sink-inputs | grep -qi 'application.name = "Spotify"'; then
    echo "$SPOTIFY_INDEX"
else
    echo "$FEISHIN_INDEX"
fi




