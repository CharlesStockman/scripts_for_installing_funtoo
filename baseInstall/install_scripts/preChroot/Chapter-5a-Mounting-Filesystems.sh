#/bin/sh

# mounts the needed filesystems
# Requires Chapter-5-Creating-File-Systems.sh

mkdir /mnt/funtoo
mount /dev/nvme0n1p3 /mnt/funtoo

mkdir /mnt/funtoo/boot
mount /dev/nvme0n1p1 /mnt/funtoo/boot
