#!/bin/sh

# Downloads the initial image and untars the image in /mnt/funtoo
# Should have execute Chapter-5a-Mounting-FileSystems.sh

cd /mnt/funtoo
wget https://build.funtoo.org/1.4-release-std/x86-64bit/generic_64/stage3-latest.tar.xz

#
# --numeric owner Preserves the numeric values of the UID and GID instead of mapping them
# --xattrs, --xattrs-include An extended attribute which allows certain programs such as ping to have enhanced privileges without having
#                            to be fully suid root
#
# -p preserve regular permissions and ownership
tar --numeric-owner --xattrs --xattrs-include="*" -xpf /mnt/funtoo/stage3-latest.tar.xz
rm /mnt/funtoo/stage3-latest.tar*

#
# Copy the scripts_for_installing_funtoo to the /mnt/funtoo/root so after a chroot we can still access them
#
cp -r /root/scripts_for_installing_gentoo /mnt/funtoo/root
