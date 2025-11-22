 #!/bin/bash

ANYSPACE=$(hyprctl activewindow -j | jq -r '.pid')

if true; then
	echo "$ANYSPACE"
fi




