 #!/bin/bash



YTMPV=$(pgrep -f 'mpv --vo=null')

if pgrep -f 'mpv --vo=null'> /dev/null;then
	echo "$YTMPV"
fi
 
