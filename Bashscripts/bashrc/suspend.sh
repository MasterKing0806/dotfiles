 #!/bin/bash
systemctl suspend
sudo udisksctl unmount -b /dev/sdc3
sudo udisksctl power-off -b /dev/sdc
