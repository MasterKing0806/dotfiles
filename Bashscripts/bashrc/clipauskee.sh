 #!/bin/bash

WEGDA=$(pgrep -f "clipman")

kill $WEGDA
keepassxc
wl-paste --type text --watch clipman store --no-persist & disown
