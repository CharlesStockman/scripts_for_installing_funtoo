#!/bin/sh

#
# Copy the scripts_for_installing_funtoo to the /mnt/funtoo/root so after a chroot we can still access them
#
cp -r /root/scripts_for_installing_funtoo /mnt/funtoo/root

#
# When the exit command is executed then reboot
#
trap 'cd /mnt; pwd; umount -lR funtoo; reboot;' exit

# Need to setup the /proc /sys /dev
# Options:
#   -t type ( example proc, ext4)
#   none -- there is no physical disk partition linked to the mount point
#   --rbind -- Remount a subtree and all possible submount shomewhere else 
#      ( so that its contents are available in both places )

cd /mnt/funtoo
mount --rbind /proc proc
mount --rbind /sys sys
mount --rbind /dev dev

# Allow for proper resolution of resolution of internet hostname from inside chroot
cp /etc/resolv.conf /mnt/funtoo/etc

# Setup a new environment
( cd /mnt/funtoo ; chroot . /bin/su --login )
